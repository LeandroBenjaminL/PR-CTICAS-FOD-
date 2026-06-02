{
4. Agregar al menú del programa del ejercicio 3, opciones para:
    a. Añadir uno o más empleados al final del archivo con sus datos ingresados por teclado.
        Tener en cuenta que no se debe agregar al archivo un empleado con un número de
        empleado ya registrado (control de unicidad).
    b. Modificar la edad de un empleado dado.
    c. Exportar el contenido del archivo a un archivo de texto llamado “todos_empleados.txt”.
    d. Exportar a un archivo de texto llamado “faltaDNIEmpleado.txt”, los empleados que no
    tengan cargado el DNI (DNI en 0).
NOTA: Las búsquedas deben realizarse por número de empleado.}


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

procedure employee_status(var e: file_employee; num_employee: integer; var status: boolean);
var
    file_output: employee_rec; 
begin
    status := False;
    while eof(e) do 
    begin
        read(e,file_output);
        if(file_output.num = num_employee) then status := True;
    end;



end;

procedure menu_print();
begin
    writeln('Bienvenido al menu: seleccione una opcion:');
    writeln('1: Crear archivo');
    writeln('2: Buscar empleado');
    writeln('3: Listar empleados');
    writeln('4: Empleados mayores de 70');
    writeln('5: Añadir empleados');
    writeln('6: Modificar edad de empleado');
    writeln('7: Exportar todos los empleados');
    writeln('8: Exportar empleados sin DNI');
    writeln;
end;

procedure create_file(var e: file_employee);                        // 1 
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





procedure view_employee_search(var e: file_employee);               // 2
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



procedure list_employees(var e: file_employee);                 // 3
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


procedure employees_over70(var e: file_employee);                   // 4
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

procedure add_employees(var e: file_employee);              // 5 
var
    employed: employee_rec; status: boolean;
begin
    link_file(e);
    reset(e);
    load_employees(employed);
    employee_status(e,employed.num,status);
    if status then 
    begin
        seek(e, filesize(e));
        write(e,employed); 
    end
    else writeln('El empleado ya existe');  
    close(e);
end;


var
  election: byte; 
  employee_file : file_employee;

begin
    menu_print();
    readln(election);
    while election <> 9 do 
    begin
        case election of 
            1: create_file(employee_file);
            2: view_employee_search(employee_file);
            3: list_employees(employee_file);
            4: employees_over70(employee_file);
            5: add_employees(employee_file);
          //  6: modify_employee_age(employee_file);
          //  7: export_all_employees(employee_file);
          //  8: export_employees_without_dni(employee_file);
            else writeln('Opción no válida');
        end;
        menu_print();
        readln(election);
    end;

end.

