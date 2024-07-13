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
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbgrd1CellClick(Column: TColumn);
    procedure btn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure cbb1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a: string;
  diskon: string;

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


procedure TForm1.btn3Click(Sender: TObject);
//code untuk button edit
begin
  begin
  if edt1.Text = '' then
  begin
   ShowMessage('NIK tidak boleh kosong.');
  end else

    // Validasi Nama
  if edt2.Text = '' then
  begin
   ShowMessage('Nama tidak boleh kosong.');
  end else
  if edt1.Text=zqry1.Fields[1].AsString then
  begin
  ShowMessage('nama '+ edt1.Text+' Tidak Ada Perubahan');
  end else
  //kode update
  with zqry1 do
  begin
    SQL.Clear;
    SQL.Add('UPDATE kustomer SET nik=:nik, nama=:nama, telp=:telp, email= :email, alamat= :alamat, member=:member WHERE id = :id');
    params.ParamByName('nik').value := edt1.Text;
    Params.ParamByName('nama').Value := edt2.Text;    // Nama baru
    Params.ParamByName('telp').Value := edt3.Text;    // Telp baru
    Params.ParamByName('email').Value := edt4.Text;  // Email baru
    Params.ParamByName('alamat').Value := edt5.Text; // Alamat baru
      // member baru
    if cbb1.Text = 'YA' then
      Params.ParamByName('member').Value := 'YA'
    else if cbb1.Text = 'NO' then
    Params.ParamByName('member').Value := 'NO';
    Params.ParamByName('member').Value := edt5.Text;
    Params.ParamByName('id').Value := 1; // Replace with the actual ID
    ExecSQL;
    SQL.Clear;
    SQL.Add('select * from kustomer');
    Open;
    end;
    ShowMessage('Data Berhasil Diupdate!');
  end;
  posisiawal;
  if cbb1.Text = 'YA' then
    lbl8.Caption := 'Diskon: 15%'
  else if cbb1.Text = 'NO' then
    lbl8.Caption := 'Diskon: 10%';
end;

procedure TForm1.FormShow(Sender: TObject);
begin
posisiawal;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
 edt1.Text := zqry1.Fields[1].AsString;
 edt2.Text := zqry1.Fields[2].AsString;
 edt3.Text := zqry1.Fields[3].AsString;
 edt4.Text := zqry1.Fields[4].AsString;
 edt5.Text := zqry1.Fields[5].AsString;
 cbb1.Text := zqry1.Fields[6].AsString;
 a:=zqry1.Fields[0].AsString;

  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;

  btn2.Enabled := True;
  btn3.Enabled := True;
  btn4.Enabled := True ;
 btn5.Enabled:= True;
 btn1.Enabled:= False;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  // Enable input components and buttons / mengaktifkan button juka button tambah dikliikk
  edt1.Enabled := True;
  edt2.Enabled := True;
  edt3.Enabled := True;
  edt4.Enabled := True;
  edt5.Enabled := True;
  cbb1.Enabled := True;
  btn2.Enabled := True;
  btn3.Enabled := True;
  btn4.Enabled := True;
  btn5.Enabled := True;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
cbb1.Items.Add('YES');
cbb1.Items.Add('NO');
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
// HAPUS
  with zqry1 do
  begin
    SQL.Text := 'DELETE FROM kustomer WHERE nik = :nik';
    Params.ParamByName('nik').Value := edt1.Text;
    ExecSQL;

    SQL.Clear;
    SQL.Add('select * from kustomer');
    Open;
  end;
   ShowMessage('Data Berhasil Dhapus!');;
end;

procedure TForm1.btn5Click(Sender: TObject);
begin
edt1.Text :='';
edt2.Text :='';
edt3.Text :='';
edt4.Text :='';
edt5.Text :='';
cbb1.Text :='';
end;

procedure TForm1.cbb1Change(Sender: TObject);
begin
if cbb1.Text = 'YA' then
  begin
    lbl8.Caption := 'Diskon: 15%';
    // Update the database table with the selected item
    with zqry1 do
    begin
      SQL.Text := 'UPDATE kustomer SET member = :member WHERE id = :id';
      Params.ParamByName('member').Value := 'YA';
      Params.ParamByName('id').Value := 1; // Replace with the actual ID
      ExecSQL;
    end;
  end
  else if cbb1.Text = 'NO' then
  begin
    lbl8.Caption := 'Diskon: 10%';
    // Update the database table with the selected item
    with zqry1 do
    begin
      SQL.Text := 'UPDATE kustomer SET member = :member WHERE id = :id';
      Params.ParamByName('member').Value := 'NO';
      Params.ParamByName('id').Value := 1; // Replace with the actual ID
      ExecSQL;
    end;
  end;
  // Refresh the DBGrid to display the updated data
  dbgrd1.Refresh;
end;

end.


