{
2. Realizar un algoritmo, que utilizando el archivo de números enteros no ordenados creado en el 
ejercicio 1, informe por pantalla cantidad de números menores a 15000 y el promedio de los 
números ingresados. El nombre del archivo a procesar debe ser proporcionado por el usuario 
una única vez.  Además, el algoritmo deberá listar el contenido del archivo en pantalla. Resolver 
el ejercicio realizando un único recorrido del archivo.

C:\Users\54116\Desktop\lea\2do AÑO\FOD\Prácticas\Ejercicios Practica 1\1\pepe
}

program ejercicio2;
const 
    max_num = 15000;
type 
    integer_file = file of integer;
var 
    name_input: string; 
    nums_file: integer_file;
    output_file: integer; 
    count_15000,tot_nums: integer; 
    nums_cumulative:LongInt;
begin

    writeln('Ingrese el nombre del archivo a procesar'); readln(name_input);
    assign(nums_file,name_input);
    reset(nums_file);

    count_15000:= 0;  tot_nums := 0;  nums_cumulative:= 0;
    while(not eof(nums_file)) do 
    begin
        read(nums_file ,output_file); 
        write(output_file, ' | ');
        tot_nums := tot_nums + 1;
        nums_cumulative := nums_cumulative + output_file; 
        if output_file < max_num  then count_15000 := count_15000 + 1;
    end;

    writeln;
    writeln('La cantidad de numeros menores a 15000 es: ', count_15000 );
    if tot_nums <> 0 then
    writeln('el promedio de los numeros ingresados es: ', nums_cumulative/tot_nums:2:2 ); 

    close(nums_file);
end.