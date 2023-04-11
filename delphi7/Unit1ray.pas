unit Unit1ray;

interface

uses      math,
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    StringGrid1: TStringGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  x1, y1, RazmerX, RazmerY: integer;
  Mycolor: boolean;
  deg: extended;


implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
  procedure stepsR;
  var
    //  RazmerX,RazmerY:integer;
    //Edge, logic, p: pointer;
    Edge, logic, p: integer;
    y, x, xf, yf, TracerX, TracerY, steps, stepsInString, stepRare,
    stepFrequent, stepFrequentD, stepsBig, StringDivTrunc, StringFinish,
    StringStart, Punctir, Nechto, incTracerY: integer;
    px, py: ^integer;
    Biger, countPix, Ostatok, Ostatok1, CaTanDegP, xRazmerX, yRazmerY,
    bigStep, runTime, steps1, steps2, dt, dt1: integer;
    CaTanDeg, TanDeg, TracerYDiv, stepsBigD: extended;
    TracBool: boolean;
    //вторичный блок переменных
    StringDiv, StringDiv1: extended;
    znak: integer;
  label
    p1, p2, p3, p4;
  label
    logic1, logic2, logic3, logic4;
  label
    Edge1, Edge2, Edge3, Edge4;


    procedure Vstavka;//процедура вставка
    begin
      stepFrequent := round(CaTanDeg);
      StringDiv := frac(CaTanDeg);

      StringDiv1 := 1 - StringDiv;
      znak := sign(0.5 - StringDiv) * sign(StringDiv);
      if StringDiv > 0.5 then
        stepsBig := round(1 / StringDiv1)
      else
        stepsBig := round(1 / StringDiv);
      if StringDiv = 0 then  stepsBig := 1;
      Ostatok1 := 1;
      if CaTanDeg = 1 then
        begin
          znak := 0;
          Ostatok1 := 0;
        end;
      stepRare := stepFrequent + znak;
      bigStep := stepsBig * stepFrequent;//поправил
      if bigStep = 0 then
      begin
        bigStep := stepRare;
        stepRare := 0;

      end;
    Label1.Caption := IntToStr(stepRare);
    Label2.Caption := IntToStr(stepFrequent);
    Label6.Caption := IntToStr(stepsBig);
//      if stepsBig > 1 then stepsBig := stepsBig + 1;
    incTracerY:=0;
    end;

    procedure ocantovca;
    var
      x, y: integer;

    begin
      for x := 1 to RazmerX do
      begin
        StringGrid1.Cells[x, 0] := IntToStr(x - 1);
      end;
      for y := 1 to RazmerY do
      begin
        StringGrid1.Cells[0, y] := IntToStr(y - 1);
      end;
    end;

  begin //begin steps1
    deg := StrToInt(Edit1.Text);
    RazmerX := StrToInt(Edit2.Text);
    RazmerY := StrToInt(Edit3.Text);
    StringGrid1.RowCount := RazmerY + 2;
    { ”становка количества строк компонента StringGrid}
    StringGrid1.ColCount := RazmerX + 2;
    ////////////////////////////////////////////////////////////////////////////////
    ocantovca;
    ////////////////////////////////////////////////////////////////////////////////
    TanDeg := Tan(DegToRad(deg));
    {%REGION 'ttt'}
    if TanDeg = 0 then
			begin
			  CaTanDeg := RazmerX;
			  CaTanDegP := Trunc(CaTanDeg);
			  px := @x;
			  py := @y;
			  StringFinish := 0;
			  Ostatok := 0;
			  Vstavka;
			end
    else
    begin
      CaTanDeg := 1 / TanDeg;
      if CaTanDeg >= TanDeg then
      begin
        px := @x;
        py := @y;
        Vstavka;
        if CaTanDegP > 28 then CaTanDegP := 27;
      end
      else
      begin
        px := @y;
        py := @x;
        Vstavka;
        if CaTanDegP > 28 then CaTanDegP := 27;
      end;
    end;
    if CaTanDegP = 0 then
    begin
      StringFinish := 0;
      Ostatok := 0;
    end
    else
    begin
      StringDivTrunc := Trunc(RazmerX div CaTanDegP);
      //StringFinish:=28-steps*CaTanDegP;
      Ostatok := 28 - StringDivTrunc * CaTanDegP;

    end;

    {%ENDREGION}

    x := RazmerX - 1;
    xRazmerX := x;
    StringStart := x;
    yRazmerY := RazmerY - 1;
    y := 0;
    TracerY := 0;
    TracerX := 0;
    steps := 0;
    logic:=1;//logic := @logic1;
    p:=1;//p := @p1;
    edge:=1;//Edge := @Edge1;
    steps1 := 0;
    xf := 0;
    yf := y + 1;
    stepFrequentD := stepFrequent;
    stepsBigD := 1 / (stepsBig + 1);
    steps2:=1;
    // дл€ отладки первой фазы--------------------------------------------------------------------------------------------------------
    runTime := gettickcount;//64;
    repeat ///////////////////////////////////////
      repeat
        {asm
                 JMP     logic
        end; }
        case logic of
          1: goto logic1;
          2: goto logic2;
          3: goto logic3;
        end;
        logic1://пропускаем первую строку
         logic:=2;// logic := @logic2;
        goto logic4;
        logic2:
         edge:=3;// Edge := @Edge3;
        logic:=3;//logic := @logic3;
        logic3:
          TracerY := y - steps1;//расчЄт €чейки правого столбца
        TracerX := 0;
        if TracerY < 0 then
        begin
          TracerX := RazmerX - (stepFrequent * y + znak *trunc(y / (stepsBig+1)));//(stepFrequent * y + znak *trunc(y / (stepsBig+1)))
          if TracerX < 0 then TracerX := 0;
          TracerY := 0;
        end;
        logic4:
          //  altHead:=@altHead1;
          steps := stepsBig;
        repeat
          if steps = 0 then
          begin
            Biger := x - stepRare+1;
            steps := stepsBig+1;
          end
          else
          begin
            Biger := x - stepFrequent + 1;
          end;
          if Biger < 0 then Biger := 0;
          repeat
            {%REGION 'Engine'}
            xf := x + 1;
            //если раскомментироваnm строки ѕосле jmp p  то начнЄтс€ вывод данных в таблицу
            {asm //////////////////////////////
                     JMP     p
            end;  }
        case p of
          1: goto p1;
          2: goto p2;
          3: goto p3;
        end;
            p1:
              StringGrid1.Cells[xf, yf] :=
                IntToStr(TracerX) + ',' + IntToStr(TracerY) + ',' + '1';
            //запись правого столбца
            p:=3;//p := @p3;
            goto p4;
            p2:
              StringGrid1.Cells[xf, yf] := IntToStr(xf) + ',' + IntToStr(yf) + ',' + '0';
            //автоматическое забивание координат в местах скоса трассы
            p:=3;//p := @p3;
            goto p4;
            p3:
              StringGrid1.Cells[xf, yf] := IntToStr(xf) + ',' + IntToStr(y) + ',' + '0';
            //автоматическое забивание координат трассы на пр€мых участках
            p4:
              Dec(x);
            {%ENDREGION}
          until x < Biger;
         { asm
                   JMP     Edge
          end; }
        case edge of
          1: goto edge1;
          2: goto edge2;
          3: goto edge3;
        end;
          Edge1:
            //подсчЄт шагов в первой строке - других расчЄтов дл€ первой строки не требуетс€ и знание этого значени€ нужно дл€ последней строки
            Inc(steps1);
          goto Edge3;
          Edge2:
            //трассировку начальной €чейки каждого шага последней обрабатываемой строки кроме правого столбца
          if RazmerX > RazmerY then begin
                  inc (steps2);
                  Dec(steps1);
                  if y < stepsBig+1  then begin
    TracerX := x - (stepFrequent * y  + znak * trunc(y / (stepsBig+1))+znak *trunc((y+steps2) / (stepsBig+1)))+1;
    if y+steps2 = stepsBig+1 then begin
       TracerX := x - (stepFrequent * y  + znak * trunc(y / (stepsBig+1)))+1;
  end;


    if steps =0 then steps2 := 0;
                  end else begin
    TracerX := x - (stepFrequent * y  + znak * trunc(y / (stepsBig+1)))+1;
                 end;
 //  if y > stepsBig+1+steps2 then TracerX := x - (stepFrequent * y  + znak * trunc(y / (stepsBig+1))+znak *sign(trunc((y+steps2) / (stepsBig+1))))+1;

    if TracerX<1 then begin
       TracerY := y - steps1;
       TracerX := 0;
       if TracerY < 0 then TracerY := 0;
    end;
         end else begin
           Dec(steps1);
            TracerY := y - steps1;
            TracerX := 0;
          end;

          p:=1;//p := @p1;
          goto Edge4;
          Edge3:
          p:=2;// p := @p2;
          Edge4:
            Dec(steps);
        until x < 0;
        /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        Inc(y);
        yf := y + 1;
        p:=1;//p := @p1;
        x := xRazmerX;
      until y > yRazmerY - 1;
      edge:=2;//Edge := @Edge2;
    until y > yRazmerY;
    runTime := gettickcount - runTime; //  64
    Label5.Caption := IntToStr(runTime);
  end;

begin
  stepsR;
end;

end.
