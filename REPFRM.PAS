unit repfrm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, ExtCtrls, quickrpt, Qrctrls, ComCtrls;

type
  TExpRep = class(TForm)
    BitBtn1: TBitBtn;
    ScrollBox1: TScrollBox;
    MexRep: TQuickRep;
    Bevel1: TBevel;
    QRBand1: TQRBand;
    QRLabel1: TQRLabel;
    QRBand2: TQRBand;
    QRBand3: TQRBand;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRBand4: TQRBand;
    QRExpr1: TQRExpr;
    QRLabel5: TQRLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Bevel2: TBevel;
    BitBtn3: TBitBtn;
    RadioGroup1: TRadioGroup;
    Label4: TLabel;
    Edit1: TEdit;
    Bevel3: TBevel;
    BitBtn4: TBitBtn;
    Label5: TLabel;
    QrepDExp: TQuickRep;
    QRBand5: TQRBand;
    QRLabel6: TQRLabel;
    QRBand6: TQRBand;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRBand8: TQRBand;
    QRExpr2: TQRExpr;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    ChildBand1: TQRChildBand;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    QRDBText8: TQRDBText;
    QRBand7: TQRBand;
    QRLabel9: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRExpr3: TQRExpr;
    QRLabel13: TQRLabel;
    QRShape1: TQRShape;
    QRLabel14: TQRLabel;
    QRDBText9: TQRDBText;
    QRExpr4: TQRExpr;
    QRShape2: TQRShape;
    QRShape3: TQRShape;
    QRShape4: TQRShape;
    QRShape5: TQRShape;
    QRShape6: TQRShape;
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ExpRep: TExpRep;

implementation

{$R *.DFM}

uses
  expdm;

procedure TExpRep.BitBtn4Click(Sender: TObject);
const
sqlmxp: string = 'select * from Mexp.DB';
begin
with edm do begin
  gensql.Close;
  gensql.SQL.Clear;
  gensql.SQL.add(sqlmxp);
  gensql.Open;
end;

  MexRep.Preview;
end;

procedure TExpRep.BitBtn3Click(Sender: TObject);
const
sqlall: string = 'select * from mexp, dexp where (dexp.mexp_code = mexp.exp_code) And (dexp.Exp_Date >= :FromDate And dexp.Exp_Date <= :ToDate)';
sqlone: String = 'select * from mexp, dexp where (dexp.mexp_code = mexp.exp_code) And (dexp.MExp_code = :expno) And (dexp.Exp_Date >= :FromDate And dexp.Exp_Date <= :ToDate)';
begin
  with edm do begin
    gensql.Close;
    gensql.SQL.Clear;

    case RadioGroup1.ItemIndex of
      0: gensql.SQL.add(sqlall);
      1: begin
        gensql.SQL.add(sqlone);
        gensql.parambyname('expno').ASInteger := strtoint(Edit1.text);
      end;
    end;
    gensql.parambyname('fromdate').ASdatetime := strtodate(MaskEdit1.Text);
    gensql.parambyname('todate').ASdatetime := strtodate(MaskEdit2.Text);

    gensql.Open;
  end;
  QrepDExp.Preview;

end;











procedure TExpRep.BitBtn1Click(Sender: TObject);
begin
  close;
end;






end.
