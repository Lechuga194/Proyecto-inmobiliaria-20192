/*
    Proyecto final | Lechuga Martinez José Eduardo | BD 
 */
package MVC;

import java.sql.SQLException;
import java.util.Scanner;

/**
 *
 * @author Lechuga194
 */
public class Vista {

    Scanner sc = new Scanner(System.in);
    Controlador controlador = new Controlador();
    int valorC, nbmedios, nbcompletos, nestaciona, nhabita, npisos, tamha, tamte,
            dia, mes, año, ubicado, CP, totalEdif, mantenimiento, idempresa, añoN, mesN, diaN, colonia,
            seleccionGeneral, seleccionInterna, seleccionAuxiliar, aux, ext, inte, precio;
    String material, estado, existe, nombre, aPaterno, aMaterno, auxiliar, municipio, calle, descripcion;

    public void menu() throws SQLException {
        do {
            System.out.println("Lechuga Martinez Jose Eduardo | Proyecto final | BD"
                    + "\n ¿Que deseas hacer?"
                    + "\n1: Consultar en la BD"
                    + "\n2: Insertar filas en la BD"
                    + "\n3: Eliminar filas en la BD"
                    + "\n4: Modificar filas en la BD"
                    + "\n0: Salir");

            seleccionGeneral = sc.nextInt();
            switch (seleccionGeneral) {
                case 1:
                    do {
                        System.out.println("Selecciona la opcion deseada"
                                + "\n1:  consultar casas registradas"
                                + "\n2:  consultar departamentos registrados"
                                + "\n3:  consultar terrenos registrados"
                                + "\n4:  consultar asesores registrados"
                                + "\n5:  consultar dueños registrados"
                                + "\n6:  consultar direcciones registradas"
                                + "\n7:  consultar caracterisitcas registradas"
                                + "\n8:  consultar amenidades registradas"
                                + "\n9:  consultar servicios registrados"
                                + "\n10: consultar seguros registrados"
                                + "\n11: consultar empresas registradas"
                                + "\n12: consultar las propiedades que tienen las empresas"
                                + "\n13: consultar asesores asignados a una casa"
                                + "\n14: consultar asesores asignados a un departamento"
                                + "\n15: consultar asesores asignados a un terreno"
                                + "\n16: consultar el historial de precios de una casa"
                                + "\n17: consultar el historial de precios de un departamento"
                                + "\n18: consultar el historial de precios de un terreno"
                                + "\n19: consultar los exdueños de una casa"
                                + "\n20: consultar los exdueños de un departamento"
                                + "\n21: consultar los exdueños de un terreno"
                                + "\n0:  SALIR");
                        seleccionInterna = sc.nextInt();
                        switch (seleccionInterna) {
                            case 1:
                                controlador.consulta1();
                                break;
                            case 2:
                                controlador.consulta2();
                                break;
                            case 3:
                                controlador.consulta3();
                                break;
                            case 4:
                                controlador.consulta4();
                                break;
                            case 5:
                                controlador.consulta5();
                                break;
                            case 6:
                                controlador.consulta6();
                                break;
                            case 7:
                                controlador.consulta7();
                                break;
                            case 8:
                                controlador.consulta8();
                                break;
                            case 9:
                                controlador.consulta9();
                                break;
                            case 10:
                                controlador.consulta10();
                                break;
                            case 11:
                                controlador.consulta11();
                                break;
                            case 12:
                                controlador.consulta12();
                                break;
                            case 13:
                                System.out.println("Introduce el numero de registro de la casa que deseas consultar");
                                auxiliar = sc.next();
                                controlador.consulta13(auxiliar);
                                auxiliar = null;
                                break;
                            case 14:
                                System.out.println("Introduce el numero de registro del departamento que deseas consultar");
                                auxiliar = sc.next();
                                controlador.consulta14(auxiliar);
                                auxiliar = null;
                                break;
                            case 15:
                                System.out.println("Introduce el numero de registro del terreno que deseas consultar");
                                auxiliar = sc.next();
                                controlador.consulta15(auxiliar);
                                auxiliar = null;
                                break;
                            case 16:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                            case 17:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                            case 18:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                            case 19:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                            case 20:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                            case 21:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                            default:
                                System.out.println("Introduce el numero de registro de la casa");
                                auxiliar = sc.next();
                                controlador.consulta16(auxiliar);
                                auxiliar = null;
                                break;
                        }
                    } while (seleccionInterna != 0);
                    break;
                case 2:
                    do {
                        System.out.println("Selecciona la opcion deseada"
                                + "\n1:  agregar una casa a la BD"
                                + "\n2:  agregar un departamento a la BD"
                                + "\n3:  agregar un terreno a la BD"
                                + "\n4:  agregar una empresa a la BD"
                                + "\n5:  agregar un asesor a la BD"
                                + "\n6:  agregar un dueño a la BD"
                                + "\n7:  agregar una colonia a la BD"
                                + "\n8:  agregar una direccion a la BD"
                                + "\n9:  agrega una amenidad a la BD"
                                + "\n10: agregar una caracteristirca a la BD"
                                + "\n11: agregar un servicio a la BD"
                                + "\n12: agregar un seguro a la BD"
                                + "\n13; agregar ua escuela cercana a una colonia"
                                + "\n14: agregar un hospital cercano a una colonia"
                                + "\n15: agregar un recreativo cercano a una colonia"
                                + "\n16: agregar un transporte cercano a una colonia"
                                + "\n0:  SALIR");
                        seleccionInterna = sc.nextInt();

                        switch (seleccionInterna) {
                            case 1:
                                System.out.println("Introduce el valor catastral de la propiedad");
                                valorC = sc.nextInt();
                                System.out.println("¿Que material predomina?");
                                material = sc.next();
                                System.out.println("¿cuantos baños medios tiene?");
                                nbmedios = sc.nextInt();
                                System.out.println("y, ¿cuantos completos?");
                                nbcompletos = sc.nextInt();
                                System.out.println("¿Cuantos estacionamientos tiene?");
                                nestaciona = sc.nextInt();
                                System.out.println("¿Cuantas habitaciones tiene?");
                                nhabita = sc.nextInt();
                                System.out.println("¿Cuantos pisos tiene la casa?");
                                npisos = sc.nextInt();
                                System.out.println("¿Cuantos metros son habitables?");
                                tamha = sc.nextInt();
                                System.out.println("¿Cuantos metros mide el terreno completo?");
                                tamte = sc.nextInt();
                                System.out.println("¿Como se encuentra la casa?");
                                estado = sc.next();
                                System.out.println("Introduce el año de construccion");
                                año = sc.nextInt();
                                System.out.println("Introduce el mes de construccion en digitos");
                                mes = sc.nextInt();
                                System.out.println("Introduce el dia de construccion en digitos");
                                dia = sc.nextInt();
                                controlador.inserta1(valorC, material, nbmedios, nbcompletos, nestaciona, nhabita, npisos, tamha, tamte, estado, dia, mes, año);
                                break;
                            case 2:
                                System.out.println("Introduce el valor catastral de la propiedad");
                                valorC = sc.nextInt();
                                System.out.println("¿Que material predomina?");
                                material = sc.next();
                                System.out.println("¿cuantos baños medios tiene?");
                                nbmedios = sc.nextInt();
                                System.out.println("y, ¿cuantos completos?");
                                nbcompletos = sc.nextInt();
                                System.out.println("¿Cuantos estacionamientos tiene?");
                                nestaciona = sc.nextInt();
                                System.out.println("¿Cuantas habitaciones tiene?");
                                nhabita = sc.nextInt();
                                System.out.println("¿Cuantos metros son habitables?");
                                tamha = sc.nextInt();
                                System.out.println("¿Cuantos metros mide el terreno completo?");
                                tamte = sc.nextInt();
                                System.out.println("¿Como se encuentra el departamento?");
                                estado = sc.next();
                                System.out.println("Introduce el año de construccion en digitos");
                                año = sc.nextInt();
                                System.out.println("Introduce el mes de construccion en digitos");
                                mes = sc.nextInt();
                                System.out.println("Introduce el dia de construccion en digitos");
                                dia = sc.nextInt();
                                System.out.println("En que piso se ubica?");
                                ubicado = sc.nextInt();
                                System.out.println("Cuantos departamentos hay en el edificio?");
                                totalEdif = sc.nextInt();
                                System.out.println("Cual es el costo anual de mantenimiento");
                                mantenimiento = sc.nextInt();
                                controlador.inserta2(valorC, material, nbmedios, nbcompletos, nestaciona, nhabita, tamha, tamte, estado, dia, mes, año, ubicado, totalEdif, mantenimiento);
                                break;
                            case 3:
                                System.out.println("Introduce el valor catastral de la propiedad");
                                valorC = sc.nextInt();
                                System.out.println("Existe alguna construccion en el terreon? (introduce si o no)");
                                existe = sc.next();
                                controlador.inserta3(valorC, existe);
                                break;
                            case 4:
                                System.out.println("Introduce el nombre de la empresa");
                                nombre = sc.next();
                                controlador.inserta4(nombre);
                                break;
                            case 5:
                                System.out.println("Introduce el ID de la empresa donde se registrara el asesor");
                                idempresa = sc.nextInt();
                                System.out.println("Introduce el año de nacimiento del asesor (en digitos) ejemplo 1998");
                                añoN = sc.nextInt();
                                System.out.println("Introduce el mes de naciemiento del asesor (en digitos ejemplo 2");
                                mesN = sc.nextInt();
                                System.out.println("Introduce el dia de nacimiento del asesor (en digitos) ejemplo 15");
                                diaN = sc.nextInt();
                                System.out.println("Introduce el nombre del asesor (solo nombre)");
                                nombre = sc.next();
                                System.out.println("Introduce el apellido paterno del asesor");
                                aPaterno = sc.next();
                                System.out.println("Introduce el apellido materno del asesor");
                                aMaterno = sc.next();
                                System.out.println("Introduce el año en que el asesor inicio su contrato (en digitos) ejemplo 1998");
                                año = sc.nextInt();
                                System.out.println("Introduce el mes en que el asesor inicio su contrato (en digitos) ejemplo 2");
                                mes = sc.nextInt();
                                System.out.println("Introduce el dia en que el asesor inicio su contrato (en digitos) ejemplo 15");
                                dia = sc.nextInt();
                                controlador.inserta5(idempresa, diaN, mesN, añoN, nombre, aPaterno, aMaterno, dia, mes, año, mes);
                                break;
                            case 6:
                                System.out.println("Introduce el año de nacimiento del dueño (en digitos) ejemplo 1998");
                                añoN = sc.nextInt();
                                System.out.println("Introduce el mes de naciemiento del dueño (en digitos ejemplo 2");
                                mesN = sc.nextInt();
                                System.out.println("Introduce el dia de nacimiento del dueño (en digitos) ejemplo 15");
                                diaN = sc.nextInt();
                                System.out.println("Introduce el nombre del dueño (solo nombre)");
                                nombre = sc.next();
                                System.out.println("Introduce el apellido paterno del dueño");
                                aPaterno = sc.next();
                                System.out.println("Introduce el apellido materno del dueño");
                                aMaterno = sc.next();
                                controlador.inserta6(dia, mes, año, nombre, aPaterno, aMaterno);
                                break;
                            case 7:
                                System.out.println("Introduce el nombre de la nueva colonia");
                                nombre = sc.next();
                                controlador.inserta7(nombre);
                                break;
                            case 8:
                                System.out.println("Introduce el id de la colonia");
                                colonia = sc.nextInt();
                                System.out.println("Introduce el estado");
                                estado = sc.next();
                                System.out.println("Introduce el municipio");
                                municipio = sc.next();
                                System.out.println("Introduce el Codigo postal");
                                CP = sc.nextInt();
                                System.out.println("Introduce la calle");
                                calle = sc.next();
                                System.out.println("Introduce el numero exterior");
                                ext = sc.nextInt();
                                System.out.println("Introduce el numero interior");
                                inte = sc.nextInt();
                                controlador.inserta8(colonia, estado, municipio, CP, calle, ext, inte);
                                break;
                            case 9:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce una descripcion");
                                descripcion = sc.next();
                                controlador.inserta9(nombre, descripcion);
                                break;
                            case 10:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce una descripcion");
                                descripcion = sc.next();
                                controlador.inserta10(nombre, descripcion);
                                break;
                            case 11:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce una descripcion");
                                descripcion = sc.next();
                                System.out.println("Introduce el precio mensual");
                                precio = sc.nextInt();
                                controlador.inserta11(nombre, descripcion, precio);
                                break;
                            case 12:
                                System.out.println("Introduce la aseguradora");
                                nombre = sc.next();
                                System.out.println("Introduce el tipo de covertura");
                                descripcion = sc.next();
                                System.out.println("Introduce el precio anual");
                                precio = sc.nextInt();
                                controlador.inserta12(estado, estado, precio);
                                break;
                            case 13:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce el id de la colonia en la que se encuentra");
                                colonia = sc.nextInt();
                                controlador.inserta13(nombre, colonia);
                                break;
                            case 14:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce el id de la colonia en la que se encuentra");
                                colonia = sc.nextInt();
                                controlador.inserta14(nombre, colonia);
                                break;
                            case 15:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce el id de la colonia en la que se encuentra");
                                colonia = sc.nextInt();
                                controlador.inserta15(nombre, colonia);
                                break;
                            case 16:
                                System.out.println("Introduce el nombre");
                                nombre = sc.next();
                                System.out.println("Introduce el id de la colonia en la que se encuentra");
                                colonia = sc.nextInt();
                                controlador.inserta16(nombre, colonia);
                                break;
                            default:
                                break;
                        }
                        break;
                    } while (seleccionInterna != 0);
                    break;
                case 3:
                    do {
                        System.out.println("Selecciona la opcion deseada"
                                + "\n1:  eliminar una amenidad"
                                + "\n2:  eliminar un asesor"
                                + "\n3:  eliminar una caracteristica"
                                + "\n4:  eliminar una casa"
                                + "\n5:  eliminar una colonia"
                                + "\n6:  eliminar un CURP"
                                + "\n7:  eliminar un departamento"
                                + "\n8:  eliminar una direccion"
                                + "\n9:  eliminar un dueño"
                                + "\n10: eliminar una empresa"
                                + "\n11: eliminar un RFC"
                                + "\n12: eliminar un seguro"
                                + "\n13: eliminar un servicio"
                                + "\n14: eliminar un terreno"
                                + "\n0:  SALIR");
                        seleccionInterna = sc.nextInt();

                        switch (seleccionInterna) {
                            case 1:
                                break;
                            case 2:
                                break;
                            case 3:
                                break;
                            case 4:
                                break;
                            case 5:
                                break;
                            case 6:
                                break;
                            case 7:
                                break;
                            case 8:
                                break;
                            case 9:
                                break;
                            case 10:
                                break;
                            case 11:
                                break;
                            case 12:
                                break;
                            case 13:
                                break;
                            case 14:
                                break;
                            default:
                                break;
                        }
                        break;
                    } while (seleccionInterna != 0);
                    break;
                case 4:
                    do {
                        System.out.println("Selecciona la opcion deseada"
                                + "\n1:  actualiza el nombre de una amenidad"
                                + "\n2:  actualiza la descripcion de una amenidad"
                                + "\n3:  actualiza el sueldo de un asesor"
                                + "\n4:  actualiza el nombre de una caracteristica"
                                + "\n5:  actualiza la descripcion de una caracteristica"
                                + "\n6:  actualiza una casa"
                                + "\n7:  actualiza un departamento"
                                + "\n8:  actualiza un terreno"
                                + "\n10: actualiza el nombre de una colonia"
                                + "\n0:  SALIR");
                        seleccionInterna = sc.nextInt();

                        switch (seleccionInterna) {
                            case 1:
                                break;
                            case 2:
                                break;
                            case 3:
                                break;
                            case 4:
                                break;
                            case 5:
                                break;
                            case 6:
                                break;
                            case 7:
                                break;
                            case 8:
                                break;
                            case 9:
                                break;
                            case 10:
                                break;
                            default:
                                break;
                        }
                        break;
                    } while (seleccionInterna != 0);
                    break;
                default:
                    break;
            }
        } while (seleccionGeneral != 0);

    }
}
