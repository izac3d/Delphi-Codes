program Costing;

uses
  Forms,
  HTMLHelpViewer,
  SysUtils,
  frmFrames in 'frmFrames.pas' {Framesfrm},
  dmCosting in 'dmCosting.pas' {CostingDM: TDataModule},
  frmInventory in 'frmInventory.pas' {BOMInventoryfrm},
  costFrmMain in 'costFrmMain.pas' {Mainfrm},
  frmSeries in 'frmSeries.pas' {Seriesfrm},
  frmBOM in 'frmBOM.pas' {BOMfrm},
  frmPricing in 'frmPricing.pas' {Pricingfrm},
  DMReports in 'DMReports.pas' {ReportsDM: TDataModule},
  frmGlass in 'frmGlass.pas' {Glassfrm},
  dbconnect in '..\common\dbconnect.pas' {frmDBConnect},
  sfrmSettings in 'sfrmSettings.pas' {Settingsfrm},
  myFunc in '..\common\myFunc.pas',
  ndThreadClass in '..\common\ndThreadClass.pas',
  Vcl.Themes,
  Vcl.Styles,
  dsplashfrm in '..\splashdll\dsplashfrm.pas' {frmSplash},
  frmSalesZones in 'frmSalesZones.pas' {SalesZonesfrm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'WINDOZ Costing';
  Application.HelpFile := '.\Help\Costing.CHM';
  Application.CreateForm(TCostingDM, CostingDM);
  Application.CreateForm(TMainfrm, Mainfrm);
  Application.CreateForm(TReportsDM, ReportsDM);
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.CreateForm(TSalesZonesfrm, SalesZonesfrm);
  Application.Run;
end.
