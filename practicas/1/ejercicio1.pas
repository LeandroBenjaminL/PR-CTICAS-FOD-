{1. Realizar un algoritmo que cree un archivo binario de números enteros no ordenados y permita 
incorporar datos al archivo. Los números son ingresados desde el teclado. La carga finaliza 
cuando se ingresa el número 30000, que no debe incorporarse al archivo. El nombre del archivo 
debe ser proporcionado por el usuario desde el teclado. }


program ejercicio1; 
type
    integer_file = file of integer; 
var
    input_nums: integer;
    nums_file: integer_file;
    name_file: string;  
    output_file: integer;
begin
    writeln('Ingrese el nombre del archivo');

    readln(name_file); assign(nums_file,name_file);
    writeln('Ingrese numeros enteros'); readln(input_nums);
    rewrite(nums_file);
    while(input_nums <> 30000) do 
    begin
        write(nums_file,input_nums);
        writeln('Ingrese numeros enteros'); readln(input_nums);
    end;
    close(nums_file);
end.