unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl5: TLabel;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    edt4: TEdit;
    edt5: TEdit;
    cbb1: TComboBox;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    dbgrd1: TDBGrid;
    lbl9: TLabel;
    edt6: TEdit;
    con1: TZConnection;
    zqry1: TZQuery;
    ds1: TDataSource;
    procedure posisiawal;
    procedure bersih;
    procedure btn2Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
cbb1.Clear;
end;

procedure TForm1.posisiawal;
begin
btn1.Enabled:= True;
btn2.Enabled:= False;
btn3.Enabled:= False;
btn4.Enabled:= False;
btn5.Enabled:= False;
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
cbb1.Clear;
edt1.Enabled:=False;
edt2.Enabled:=False;
edt3.Enabled:=False;
edt4.Enabled:=False;
edt5.Enabled:=False;
cbb1.Enabled:=False;
end;

procedure TForm1.btn2Click(Sender: TObject);
//code untuk button simpan
begin
if zqry1.Locate('nama',edt2.Text,[])then
begin
  ShowMessage('Nama'+ edt2.Text+' Sudah Ada Didalam Sistem');
end else
begin
  with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('Insert into kustomer values(null, "' + edt1.Text + '", "' + edt2.Text + '", "' + edt3.Text + '", "' + edt4.Text + '", "' + edt5.Text + '", "' + cbb1.Text + '")');
    ExecSQL;
    SQL.Clear;
    SQL.Add('Select * from kustomer');
    Open;
  end;
  ShowMessage('Data Berhasil Disimpan!');
end;
  posisiawal;
end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
 if cbb1.ItemIndex = 0 then // assuming "YES" is the first item in the combobox
    lbl8.Caption := '15%' // set the label caption to "10%"
  else
    lbl8.Caption := '10%' // set the label caption to "5%"
end;

procedure TForm1.btn3Click(Sender: TObject);
//code untuk button edit
begin
  begin
  try
    // Validasi NIK
    if Trim(edt1.Text) = '' then
    begin
      ShowMessage('NIK tidak boleh kosong.');
      Exit;
    end;

    // Validasi Nama
    if Trim(edt2.Text) = '' then
    begin
      ShowMessage('Nama tidak boleh kosong.');
      Exit;
    end;

    // Menyiapkan perintah SQL untuk memperbarui data customer berdasarkan NIK
    Form1.ZQuery1.SQL.Clear;
    Form1.ZQuery1.SQL.Add('UPDATE kustomer SET NAMA = :nama, TELP = :telp, ' +
                          'EMAIL = :email, ALAMAT = :alamat WHERE NIK = :nik');

    // Menetapkan nilai parameter
    Form1.ZQuery1.Params.ParamByName('nama').AsString := edt2.Text;    // Nama baru
    Form1.ZQuery1.Params.ParamByName('telp').AsString := edt3.Text;    // Telp baru
    Form1.ZQuery1.Params.ParamByName('email').AsString := Edit4.Text;  // Email baru
    Form1.ZQuery1.Params.ParamByName('alamat').AsString := Edit5.Text;  // Alamat baru
    Form1.ZQuery1.Params.ParamByName('nik').AsString := Edit1.Text;      // NIK dari baris yang akan diperbarui

    // Mengeksekusi perintah SQL
    Form1.ZQuery1.ExecSQL;

    // Menyusun perintah SQL untuk membuka data yang telah dimasukkan
    ZQuery1.SQL.Clear;
    ZQuery1.SQL.Add('SELECT * FROM kustomer');
    ZQuery1.Open;

    // Refresh DBGrid
    DBGrid1.DataSource.DataSet := ZQuery1;
    DBGrid1.Refresh;

    // Menampilkan pesan sukses
    ShowMessage('Data customer berhasil diupdate untuk NIK yang dimasukkan!');
  except
    on E: Exception do
      ShowMessage('Terjadi kesalahan: ' + E.Message);
  end;
end;
  posisiawal;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

end.


