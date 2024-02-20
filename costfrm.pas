unit costfrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, DB,
  Dialogs, StdCtrls, ExtCtrls, fibdataset, DBCtrls, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxCheckBox, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  Buttons, cxDBLookupComboBox, cxDBExtLookupComboBox, Grids, DBGrids;

type
  TfrmVendInv = class(TForm)
    DBNavigator1: TDBNavigator;
    Bevel1: TBevel;
    BitBtn6: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    Button1: TButton;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1PUR_CODE: TcxGridDBColumn;
    cxGrid1DBTableView1VENDOR_ID: TcxGridDBColumn;
    cxGrid1DBTableView1PUR_DATE: TcxGridDBColumn;
    cxGrid1DBTableView1PURCH_RETURN: TcxGridDBColumn;
    cxGrid1DBTableView1NOTES: TcxGridDBColumn;
    cxGrid1DBTableView1AGENT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1PUR_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1PUR_NET_TOTAL: TcxGridDBColumn;
    cxGrid1DBTableView1EXTRA_TAX: TcxGridDBColumn;
    cxGrid1DBTableView1SALES_TAX: TcxGridDBColumn;
    cxGrid1DBTableView1CASH_DISCOUNT: TcxGridDBColumn;
    cxGrid1DBTableView1INV_CODE: TcxGridDBColumn;
    cxGrid1Level2: TcxGridLevel;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2ITEM_CODE: TcxGridDBColumn;
    cxGrid1DBTableView2itemName_lookup: TcxGridDBColumn;
    cxGrid1DBTableView2QTY: TcxGridDBColumn;
    cxGrid1DBTableView2COST_PRICE: TcxGridDBColumn;
    cxGrid1DBTableView2totalAmount_calc: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure dxDBGrid2Enter(Sender: TObject);
    procedure dxDBGrid1Enter(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure updateInventory_pur(inventory_code, item_code: integer; newQty, oldQty: real; isReturnPur_new, isReturnPur_old: boolean);
    procedure updateVendBal(vendor_id: integer; newInvTotal, oldInvTotal: real; isReturnPur_new, isReturnPur_old: boolean);
  public
    { Public declarations }
  end;

var
  frmVendInv: TfrmVendInv;

implementation

uses udm, uStyleDM, uVInvDlg;

{$R *.dfm}

procedure TfrmVendInv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := cafree;
end;

procedure TfrmVendInv.FormDestroy(Sender: TObject);
begin
  frmVendInv := nil;
end;

procedure TfrmVendInv.BitBtn6Click(Sender: TObject);
begin
  close;
end;

procedure TfrmVendInv.BitBtn8Click(Sender: TObject);
var
isPurReturn: boolean;
begin
  with DBDM do begin
    if tblPurInv.IsEmpty then exit;

    if messagebox(handle, 'Â·  —Ìœ Õ–› «·›« Ê—… ø','Õ–›', mb_yesno+mb_iconwarning) = idyes then begin
      isPurReturn := tblPurInv.fieldbyname('PURCH_RETURN').AsInteger = 1;
      ChkInventory_pur('d', isPurReturn, isPurReturn);
      //-----------------update inventory
      tblInventoryItems.DisableControls;
      tblPurInvItem.DisableControls;
      tblPurInvItem.First;
      while not tblPurInvItem.Eof do begin
        // old qty but it is the new qty
        updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger, tblPurInvItem.fieldbyname('item_code').AsInteger,
          0, tblPurInvItem.fieldbyname('QTY').AsFloat, isPurReturn, isPurReturn);

        tblPurInvItem.Next;
      end;
      tblPurInvItem.EnableControls;
      tblInventoryItems.EnableControls;
      //----------------customers
      //old total to delete
      updateVendBal(tblPurInv.fieldbyname('vendor_id').AsInteger,
        0, tblPurInv.fieldbyname('PUR_NET_TOTAL').AsFloat, isPurReturn, isPurReturn);
      //==============================================================================
      tblPurInv.Delete;
    end;

  end;
end;

procedure TfrmVendInv.BitBtn10Click(Sender: TObject);
var
isPurReturn: boolean;
inv_total: real;
begin
  inv_total := 0;
  with DBDM do begin
    tblPurInv.Insert;

    DlgVendInvoice := tDlgVendInvoice.Create(self);

    if DlgVendInvoice.ShowModal = mrOk then begin
      //update inv
      isPurReturn := tblPurInv.fieldbyname('PURCH_RETURN').AsInteger = 1;
      //-----------------update inventory
      tblPurInvItem.DisableControls;
      tblInventoryItems.DisableControls; // vip: the devexpress control prevent this table locate method to work
      tblPurInvItem.First;
      while not tblPurInvItem.Eof do begin
        updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger ,tblPurInvItem.fieldbyname('item_code').AsInteger,
          tblPurInvItem.fieldbyname('QTY').AsFloat, 0, isPurReturn, isPurReturn);

        inv_total := inv_total + tblPurInvItemtotalAmount_calc.AsFloat;

        tblPurInvItem.Next;
      end;

      //=======================================================================================
      //---------------- update vend balance
      tblPurInv.Edit;
      tblPurInv.FieldByName('PUR_TOTAL').AsFloat := inv_total;
      tblPurInv.FieldByName('PUR_NET_TOTAL').AsFloat := inv_total // cxGrid1DBTableView1.DataController.Summary.FooterSummaryValues[1]
        + tblPurInv.fieldbyname('EXTRA_TAX').AsFloat + tblPurInv.fieldbyname('SALES_TAX').AsFloat
        - tblPurInv.fieldbyname('CASH_DISCOUNT').AsFloat;
      tblPurInv.Post;

      //----------------vendors
      updateVendBal(tblPurInv.fieldbyname('vendor_id').AsInteger,
        tblPurInv.fieldbyname('PUR_NET_TOTAL').AsFloat, 0, isPurReturn, isPurReturn);

      tblPurInvItem.EnableControls;
      tblInventoryItems.EnableControls;
    end //Ok
    else begin
      tblPurInvItem.CancelUpdates;
      tblPurInv.Delete;
      tblPurInv.Refresh;
    end;
  end;

end;


procedure TfrmVendInv.BitBtn9Click(Sender: TObject);
var
isPurReturn_new,
isPurReturn_old: boolean;
old_vendid,
new_vendid: integer;
inv_total: real;
begin
  inv_total := 0;
  with DBDM do begin
    if tblPurInv.IsEmpty then exit;

    old_vendid := tblPurInv.fieldbyname('vendor_ID').AsInteger;
    isPurReturn_old := tblPurInv.fieldbyname('PURCH_RETURN').AsInteger = 1;

    tblPurInvItem.Close;
    tblPurInvItem.CachedUpdates := True;
    tblPurInvItem.AutoCommit := False;
    tblPurInvItem.Open;

    DlgVendInvoice := tDlgVendInvoice.Create(self);
    DlgVendInvoice.cxDBDateEdit1.Enabled := False;
    DlgVendInvoice.cxDBLookupComboBox1.Enabled := False;
    tblPurInvItem.UpdateRecordTypes := [cusModified, cusInserted, cusUnmodified];

    //the only way so lookup work properly and only items suit inventory displayed
    tblInventory.Locate('inv_code', tblPurInvINV_CODE.AsInteger,[]);
    if DlgVendInvoice.ShowModal = mrok then begin
      isPurReturn_new := tblPurInv.fieldbyname('PURCH_RETURN').AsInteger = 1;
      new_vendid := tblPurInv.fieldbyname('vendor_id').AsInteger;

      if (tblPurInvItem.UpdatesPending) or (isPurReturn_old <> isPurReturn_new) then begin
        //-----------------update inventory
        tblInventoryItems.DisableControls;
        tblPurInvItem.DisableControls;
        tblPurInvItem.UpdateRecordTypes := [cusModified, cusInserted, cusDeleted, cusUnmodified];
        tblPurInvItem.First;
        while not tblPurInvItem.Eof do begin

          case tblPurInvItem.UpdateStatus of
            usInserted: begin
              updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger, tblPurInvItem.fieldbyname('item_code').AsInteger,
                tblPurInvItem.fieldbyname('QTY').AsFloat, 0, isPurReturn_new, isPurReturn_old);

              inv_total := inv_total + tblPurInvItemtotalAmount_calc.AsFloat;
            end; //usInserted
            usDeleted: begin
              updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger, tblPurInvItem.fieldbyname('item_code').OldValue,
                0, tblPurInvItem.fieldbyname('QTY').OldValue, isPurReturn_new, isPurReturn_old);

            end;
            usModified: begin
              updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger, tblPurInvItem.fieldbyname('item_code').OldValue,
                0, tblPurInvItem.fieldbyname('QTY').OldValue, isPurReturn_new, isPurReturn_old);

              updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger, tblPurInvItem.fieldbyname('item_code').AsInteger,
                tblPurInvItem.fieldbyname('QTY').AsFloat, 0, isPurReturn_new, isPurReturn_old);

              inv_total := inv_total + tblPurInvItemtotalAmount_calc.AsFloat;
            end;
            usUnmodified: begin
              if (isPurReturn_old <> isPurReturn_new) then begin
                updateInventory_pur(tblPurInv.fieldbyname('INV_CODE').AsInteger, tblPurInvItem.fieldbyname('item_code').AsInteger,
                  tblPurInvItem.fieldbyname('QTY').AsFloat * 2, 0, isPurReturn_new, isPurReturn_old);

              end;
              inv_total := inv_total + tblPurInvItemtotalAmount_calc.AsFloat;
            end;
          end; //case tblInvoiceItem.UpdateStatus of

          tblPurInvItem.Next;
        end;

        //=============================================================================
        //----------------customers
        tblPurInv.Edit;
        tblPurInv.FieldByName('PUR_TOTAL').AsFloat := inv_total;
        tblPurInv.FieldByName('PUR_NET_TOTAL').AsFloat := inv_total
          + tblPurInv.fieldbyname('EXTRA_TAX').AsFloat + tblPurInv.fieldbyname('SALES_TAX').AsFloat
          - tblPurInv.fieldbyname('CASH_DISCOUNT').AsFloat;
        tblPurInv.Post;

        updateVendBal(old_vendid, 0,
          tblPurInv.fieldbyname('PUR_NET_TOTAL').OldValue, isPurReturn_new, isPurReturn_old);

        updateVendBal(new_vendid,
          tblPurInv.fieldbyname('PUR_NET_TOTAL').AsFloat, 0,isPurReturn_new, isPurReturn_old);

        tblInventoryItems.EnableControls;
        tblPurInvItem.EnableControls;
      end; //updates pending
      IBDB.ApplyUpdates([tblPurInv, tblPurInvItem]);
      IBT_Update.CommitRetaining;
    end
    else begin
      tblPurInvItem.CancelUpdates;

      tblPurInv.Edit;
      tblPurInv.fieldbyname('vendor_ID').AsInteger := old_vendid;
      if isPurReturn_old then
        tblPurInv.fieldbyname('PURCH_RETURN').AsInteger := 1
      else
        tblPurInv.fieldbyname('PURCH_RETURN').AsInteger := 0;

      tblPurInv.Post;
    end;

    tblPurInvItem.CachedUpdates := False;
    tblPurInvItem.AutoCommit := True;
  end;
end;

procedure TfrmVendInv.dxDBGrid2Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := DBDM.dsPurInv;
end;

procedure TfrmVendInv.dxDBGrid1Enter(Sender: TObject);
begin
  DBNavigator1.DataSource := DBDM.dsPurInvItem;
end;

procedure TfrmVendInv.updateInventory_pur(inventory_code, item_code: integer; newQty,
  oldQty: real; isReturnPur_new, isReturnPur_old: boolean);
begin
  with dbdm do begin
    tblInventory.Locate('INV_CODE', inventory_code,[]);
    tblInventoryItems.Locate('ITEM_CODE', item_code,[]);

    tblInventoryItems.Edit;

    if isReturnPur_old then
      tblInventoryItems.FieldByName('CUR_QTY').AsFloat := tblInventoryItems.FieldByName('CUR_QTY').AsFloat
        + oldQty
    else
      tblInventoryItems.FieldByName('CUR_QTY').AsFloat := tblInventoryItems.FieldByName('CUR_QTY').AsFloat
        - oldQty;

    if isReturnPur_new then
      tblInventoryItems.FieldByName('CUR_QTY').AsFloat := tblInventoryItems.FieldByName('CUR_QTY').AsFloat
        - newQty
    else
      tblInventoryItems.FieldByName('CUR_QTY').AsFloat := tblInventoryItems.FieldByName('CUR_QTY').AsFloat
        + newQty;

    try
      tblInventoryItems.Post;
    except
      tblPurInvItem.EnableControls;
      raise;
    end;

  end;

end;

procedure TfrmVendInv.updateVendBal(vendor_id: integer; newInvTotal,
  oldInvTotal: real; isReturnPur_new, isReturnPur_old: boolean);
begin
  with dbdm do begin
    tblVendor.Locate('vendor_id', vendor_id,[]);
    tblVendor.Edit;

    if isReturnPur_old then
      tblVendor.FieldByName('VEND_CURBAL').AsFloat :=
        tblVendor.FieldByName('VEND_CURBAL').AsFloat + oldInvTotal
    else
      tblVendor.FieldByName('VEND_CURBAL').AsFloat :=
        tblVendor.FieldByName('VEND_CURBAL').AsFloat - oldInvTotal;


    if isReturnPur_new then
      tblVendor.FieldByName('VEND_CURBAL').AsFloat :=
        tblVendor.FieldByName('VEND_CURBAL').AsFloat - newInvTotal
    else
      tblVendor.FieldByName('VEND_CURBAL').AsFloat :=
        tblVendor.FieldByName('VEND_CURBAL').AsFloat + newInvTotal;

    tblVendor.Post;
  end;

end;

procedure TfrmVendInv.FormShow(Sender: TObject);
begin
  with DBDM do begin
    if user_type = '„” Œœ„' then begin
      BitBtn8.Enabled := False;
      BitBtn9.Enabled := False;
    end;
    Items_lookup.Close;
    Items_lookup.Open;
  end;
end;

procedure TfrmVendInv.Button1Click(Sender: TObject);
var
i: integer;
begin
  with DBDM do begin
    tblPurInv.DisableControls;
    tblPurInvItem.DisableControls;

    for i := 1 to 10000 do begin
      tblPurInv.Insert;
      tblPurInv.FieldByName('PUR_DATE').AsDateTime := date;
      tblPurInv.FieldByName('inv_code').AsInteger := 2;
      tblPurInv.FieldByName('vendor_id').AsInteger := 1;
      tblPurInv.Post;

      tblPurInvItem.Insert;
      tblPurInvItem.FieldByName('PUR_CODE').AsInteger := tblPurInv.fieldbyname('PUR_CODE').AsInteger;
      tblPurInvItem.FieldByName('ITEM_CODE').AsInteger := random(20)+10;
      tblPurInvItem.FieldByName('INV_CODE').AsInteger := 2;
      tblPurInvItem.FieldByName('QTY').AsInteger := 1;
      tblPurInvItem.FieldByName('COST_PRICE').AsFloat := 1;
      tblPurInvItem.Post;

      randomize;
      tblPurInvItem.Insert;
      tblPurInvItem.FieldByName('PUR_CODE').AsInteger := tblPurInv.fieldbyname('PUR_CODE').AsInteger;
      tblPurInvItem.FieldByName('ITEM_CODE').AsInteger := random(9)+1;
      tblPurInvItem.FieldByName('INV_CODE').AsInteger := 2;
      tblPurInvItem.FieldByName('QTY').AsInteger := 1;
      tblPurInvItem.FieldByName('COST_PRICE').AsFloat := 1;
      tblPurInvItem.Post;

      application.ProcessMessages;
      caption := inttostr(i);
    end;
    tblPurInv.EnableControls;
    tblPurInvItem.EnableControls;
  end;

end;

end.
