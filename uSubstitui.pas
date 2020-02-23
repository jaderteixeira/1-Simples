unit uSubstitui;

interface

uses
  uISubstitui;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var processo, aux: String;
    tVelho, tStr, I, J, confirma: Integer;
begin
tVelho := Length(aVelho);
tStr := Length(aStr);

I := 1;
while (I <= tStr) do
  begin
  if (aStr[I] <> aVelho[1])  then
    begin
    processo := processo+aStr[I];
    Inc(I);
    end
  else
    begin
    if (tVelho = 1) then
      begin
      processo := processo+aNovo;
      Inc(I);
      end
    else
      begin
      aux := aStr[I];
      confirma := 1;
      for J := 2 to tVelho do
        begin
        if (aStr[I+J-1] = aVelho[J]) then
          begin
          aux := aux + aStr[I+J-1];
          end
        else
          begin
          confirma := 0;
          processo := processo+aux;
          Inc(I);
          break
          end;
        end;
      if (confirma = 1) then
        begin
        processo := processo+aNovo;
        I := I+J-1;
        end;
      end;
    end;
  end;
Result := processo;
end;

end.

