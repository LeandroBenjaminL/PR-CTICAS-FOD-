{
3. Realizar un programa que presente un menú con opciones para: 
a. Crear un archivo binario de registros no ordenados de empleados y completarlo con 
    datos ingresados desde teclado. De cada empleado se registra: número de empleado, 
    apellido, nombre, edad y DNI. Algunos empleados pueden ingresan el DNI con valor 0, lo 
    que significa que al momento de la carga puede no tenerlo. La carga finaliza cuando se 
    ingresa el String ‘fin’ como apellido. 

b. Abrir el archivo anteriormente generado y
    I.Listar en pantalla los datos de empleados que tengan un nombre o apellido 
    determinado, el cual se proporciona desde el teclado. 
    II: Listar en pantalla los empleados de a uno por línea.  
    III: Listar en pantalla los empleados mayores de 70 años, próximos a jubilarse. 
    NOTA: El nombre del archivo a crear o utilizar debe ser proporcionado por el usuario. 

}

program ejercicio3;
type
    employee_rec = record
        num: integer;
        last_name: string[20]; 
        name: string[20];
        age: integer;
        dni: longint; 
    end;

    file_employee = file of employee_rec;


procedure create_file(var e: file_employee);
    procedure load_employees(var e_rec: employee_rec);
    begin
        writeln('Ingrese el apellido empleado'); readln(e_rec.last_name);
        if(e_rec.last_name <> 'fin') then 
        begin
            writeln('Ingrese el nombre del empleado'); readln(e_rec.name);
            writeln('Ingrese un numero de empleado'); readln(e_rec.num);
            writeln('Ingrese la edad empleado'); readln(e_rec.age);
            writeln('Ingrese el dni empleado'); readln(e_rec.dni); 
        end
        else writeln('Termino la carga del archivo, llego el apellido "fin"');

    end;
var
    employee: employee_rec; name_file: string;
begin
    writeln('Ingrese el nombre del archivo'); readln(name_file);
    assign(e,name_file);  rewrite(e);
    load_employees(employee);
    while(employee.last_name <> 'fin') do 
    begin
        write(e, employee);
        load_employees(employee);
    end;
    close(e);
end;



procedure link_file(var e: file_employee);
var
    name_file: string;
begin
    writeln('Ingrese el nombre del archivo:');
    readln(name_file);
    assign(e, name_file);
end;

procedure print_file(e: employee_rec); 
begin
    writeln('Imprimiendo empleado: '); writeln;
    write(e.num:10); write(e.name:20); write(e.last_name:20); write(e.age:5); write(e.dni:15); writeln;
end;


procedure view_employee_search(var e: file_employee);
var
    file_output: employee_rec; employee_search: string; 
begin
    link_file(e);
    reset(e); 
    writeln('Ingrese el nombre o apellido del empleado que busca: '); readln(employee_search);
    while not eof(e) do 
    begin
        read(e,file_output);
        if ((employee_search = file_output.name) or (employee_search = file_output.last_name)) then
            print_file(file_output); 
    end;
    close(e);
end;



procedure list_employees(var e: file_employee);
var
    file_output: employee_rec; 
begin
    link_file(e);
    reset(e); 
    while not eof(e) do 
    begin
        read(e,file_output);
        print_file(file_output); 
    end;
    close(e);
end;


procedure employees_over70(var e: file_employee); 
var 
    file_output: employee_rec; 
begin
    writeln('Imprimiendo los empleados mayores de 70 proximos a jubilarse'); 
    link_file(e);
    reset(e);
    while not eof(e) do 
    begin
        read(e,file_output);
        if(file_output.age > 70) then print_file(file_output); 
    end;
    close(e);  
end;

procedure menu_print();
begin
    writeln('Bienvenido al menu: seleccione una opcion:');
    writeln('1: Crear archivo');
    writeln('2: Buscar empleado');
    writeln('3: Listar empleados');
    writeln('4: Empleados mayores de 70');
    writeln('5: Salir');
    writeln;
end;
var
  election: byte; 
  employee_file : file_employee;

begin
    menu_print();
    readln(election);
    while election <> 5 do 
    begin
        case election of 
            1: create_file(employee_file);
            2: view_employee_search(employee_file);
            3: list_employees(employee_file);
            4: employees_over70(employee_file);
            else writeln('Opción no válida');
        end;
        menu_print();
        readln(election);
    end;

end.

