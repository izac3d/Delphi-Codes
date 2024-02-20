unit maccfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, dxExEdtr, dxCntner, dxTL, dxDBCtrl, dxDBTL, dxBarDBNav,
  dxBar, DB, dxBarExtItems, StdCtrls;

type
  TfrmMainAcc = class(TForm)
    ImageList1: TImageList;
    dxDBTreeList1: TdxDBTreeList;
    dxDBTreeList1ACC_CODE: TdxDBTreeListMaskColumn;
    dxDBTreeList1ACC_NAME: TdxDBTreeListMaskColumn;
    dxDBTreeList1ACC_PARENT: TdxDBTreeListMaskColumn;
    dxDBTreeList1OPEN_BALANCE: TdxDBTreeListMaskColumn;
    dxDBTreeList1CUR_BALANCE: TdxDBTreeListMaskColumn;
    dxDBTreeList1acc_total_calc: TdxDBTreeListColumn;
    dxBarManager1: TdxBarManager;
    dxBarGroup1: TdxBarGroup;
    dxBarGroup2: TdxBarGroup;
    dxBarGroup3: TdxBarGroup;
    dxBarButton1: TdxBarButton;
    dxBarButton2: TdxBarButton;
    dxBarButton5: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarButton4: TdxBarButton;
    dxBarDBNavigator1: TdxBarDBNavigator;
    dxBarDBNavPrev2: TdxBarDBNavButton;
    dxBarDBNavNext2: TdxBarDBNavButton;
    dxBarDBNavLast2: TdxBarDBNavButton;
    dxBarDBNavRefresh2: TdxBarDBNavButton;
    dxBarDBNavFirst2: TdxBarDBNavButton;
    dxBarButton6: TdxBarButton;
    dxBarButton7: TdxBarButton;
    dxBarButton8: TdxBarButton;
    dxBarButton9: TdxBarButton;
    dxDBTreeList1ACC_ID: TdxDBTreeListMaskColumn;
    dxBarInPlaceSubItem1: TdxBarInPlaceSubItem;
    dxBarButton10: TdxBarButton;
    Images: TImageList;
    dxBarButton11: TdxBarButton;
    dxBarButton12: TdxBarButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure dxBarButton2Click(Sender: TObject);
    procedure dxBarButton9Click(Sender: TObject);
    procedure dxBarButton8Click(Sender: TObject);
    procedure dxBarButton6Click(Sender: TObject);
    procedure dxDBTreeList1GetStateIndex(Sender: TObject;
      Node: TdxTreeListNode; var Index: Integer);
    procedure dxBarButton7Click(Sender: TObject);
    procedure dxBarButton10Click(Sender: TObject);
    procedure dxBarButton11Click(Sender: TObject);
    procedure dxBarButton12Click(Sender: TObject);
  private
    { Private declarations }
  public
    fLastChild_Code,
    fLastChild_Name: TStringList;

    procedure getLastChildren;
    procedure ProcessChildren(N: TdxTreeListNode; Recurse: Boolean);

  end;

var
  frmMainAcc: TfrmMainAcc;

implementation

uses udm;

{$R *.dfm}

procedure TfrmMainAcc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmMainAcc.FormDestroy(Sender: TObject);
begin
  frmMainAcc := nil;
end;

procedure TfrmMainAcc.dxBarButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmMainAcc.dxBarButton9Click(Sender: TObject);
begin
  DBDM.tblAccTree.CancelUpdates;
end;

procedure TfrmMainAcc.dxBarButton8Click(Sender: TObject);
begin
  with DBDM do begin
    if tblAccTree.State in dseditmodes then
      tblAccTree.Post;
  end;
end;

procedure TfrmMainAcc.dxBarButton6Click(Sender: TObject);
var
parent_id: string;
begin  //same level
  //showmessage(inttostr(dxDBTreeList1.FocusedAbsoluteIndex)); //dxDBTreeList1.FocusedNode.Index
  //dxDBTreeList1.FocusedNode.Parent
  dxBarButton8.OnClick(nil);
  with DBDM do begin
    parent_val := TdxDBTreeListNode(dxDBTreeList1.FocusedNode).Id;
    if (tblAccTree.FieldByName('ACC_PARENT').AsInteger <= 9) then
      messagebox(handle, '·« Ì„ﬂ‰ √÷«›… Õ”«» —∆Ì”Ì','Œÿ√', mb_ok+mb_iconinformation)
    else begin
      parent_val := tblAccTree.FieldByName('ACC_PARENT').AsInteger;
      parent_id := dxDBTreeList1.FocusedNode.Parent.Values[1];

      IBSQL.Close;
      IBSQL.SQL.Clear;
      IBSQL.SQL.Add('select max(LEVEL_ACC_CODE) from ACC_TREE '
        +' where (ACC_ID STARTING with :parent_key) and (ACC_ID <> :parent_key)');
      IBSQL.ParamByName('parent_key').AsString := parent_id;
      IBSQL.ExecQuery;

      tblAccTree.Append;

      tblAccTree.FieldByName('ACC_ID').AsString := parent_id+'.'+inttostr(ibsql.Fields[0].AsInteger+1);
      tblAccTree.FieldByName('LEVEL_ACC_CODE').AsInteger := ibsql.Fields[0].AsInteger+1;

      tblAccTree.FieldByName('OPEN_BALANCE').AsFloat := 0;
      tblAccTree.FieldByName('CUR_BALANCE').AsFloat := 0;

      dxDBTreeList1.ShowEditor;
    end;
  end;
end;

procedure TfrmMainAcc.dxDBTreeList1GetStateIndex(Sender: TObject;
  Node: TdxTreeListNode; var Index: Integer);
begin
  if Node.Expanded then
    Index := 1
  else Index := 0;
end;

procedure TfrmMainAcc.dxBarButton7Click(Sender: TObject);
begin
  with dbdm do begin
    if tblAccTree.FieldByName('DEL_PROTECT').AsInteger = 1 then
      messagebox(handle, '·« Ì„ﬂ‰ Õ–› Õ”«» —∆Ì”Ì','Œÿ√', mb_ok+mb_iconinformation)
    else begin
      //messagebox(handle, 'Â· √‰  „ √ﬂœ ø','Õ–›', mb_yesno+mb_iconquestion);// = idyes then
      // check if there is transactions to this account
      tblAccTree.Delete;

    end;

  end;
end;

procedure TfrmMainAcc.dxBarButton10Click(Sender: TObject);
var
parent_id: string;
begin     //child  nodes
  dxBarButton8.OnClick(nil);

  with DBDM do begin
    parent_val := TdxDBTreeListNode(dxDBTreeList1.FocusedNode).Id;
    if parent_val <= 9 then
      messagebox(handle, '·« Ì„ﬂ‰ √÷«›… Õ”«» —∆Ì”Ì','Œÿ√', mb_ok+mb_iconinformation)
    else begin
      parent_val := tblAccTree.FieldByName('ACC_CODE').AsInteger;
      parent_id := dxDBTreeList1.FocusedNode.Values[1];

      IBSQL.Close;
      IBSQL.SQL.Clear;
      IBSQL.SQL.Add('select max(LEVEL_ACC_CODE) from ACC_TREE '
        +' where (ACC_ID STARTING with :parent_key) and (ACC_ID <> :parent_key)');
      IBSQL.ParamByName('parent_key').AsString := parent_id;
      IBSQL.ExecQuery;

      tblAccTree.Append;

      tblAccTree.FieldByName('OPEN_BALANCE').AsFloat := 0;
      tblAccTree.FieldByName('CUR_BALANCE').AsFloat := 0;

      tblAccTree.FieldByName('ACC_ID').AsString := parent_id+'.'+inttostr(ibsql.Fields[0].AsInteger+1);
      tblAccTree.FieldByName('LEVEL_ACC_CODE').AsInteger := ibsql.Fields[0].AsInteger+1;
      
      dxDBTreeList1.ShowEditor;
    end;
  end;
end;

procedure TfrmMainAcc.dxBarButton11Click(Sender: TObject);
begin
  dxDBTreeList1.FullExpand;
end;

procedure TfrmMainAcc.dxBarButton12Click(Sender: TObject);
begin
  dxDBTreeList1.FullCollapse;
end;

//=====================================================================================
procedure TfrmMainAcc.ProcessChildren(N: TdxTreeListNode; Recurse: Boolean);
var
  I: Integer;
begin
  for I := 0 to N.Count - 1 do begin

    if Recurse and N[I].HasChildren then
      ProcessChildren(N[I], Recurse)
    else begin
      if n.Level > 0 then begin
        fLastChild_Code.Add(N.Items[I].Values[1]);
        fLastChild_Name.Add(N.Items[I].Values[0]);
      end;
    end;

  end;
end;

procedure TfrmMainAcc.getLastChildren;
var
  I: Integer;
begin
  with dxDBTreeList1 do begin
    for I := 0 to Count - 1 do begin
      // ... To do something
      ProcessChildren(Items[I], True);
    end;
  end;

end;

end.
