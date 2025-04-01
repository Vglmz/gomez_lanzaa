#!/usr/bin/perl

#**************************************************************
#                       Pontificia Universidad Javeriana
#     Materia: Sistemas Operativos
#     Fichero: Automatiazación para ejecuaciones por lotes
#	Autor: Viviana Gomez
#         Descripcion:Ficher para la ejecución de ejecutables
#****************************************************************/

$Path = `pwd`; #Guardar el directorio actual de trabajo 
chomp($Path); #Se elimina el salto de linea


@Nombre_Ejecutable = ("mm_clasico"); #Se define un arreglo con el nombre  del archivo a ejecutar

@Size_Matriz = (500,1000); # se define un arreglo con los tamaños de la matriz a evaluar

@Num_Hilos = (1,2); #Se define un arreglo con el numero de hilos a usar

$Repeticiones = 1; #Se define la variable con el numero de repeticiones a realizar de la ejecución


foreach $Nombre_Ejecutable (@Nombre_Ejecutable) { #ciclo for en el que se recorre cada nombre en el arreglo Nombre_Ejecutable
    foreach $size (@Size_Matriz) { #Ciclo for en el que se recorre cada tamaño de matriz en el arreglo Size_Matriz
        foreach $hilo (@Num_Hilos) { #Ciclo en el que se recorre cada numero de hilos en el arreglo Num_HIlos

            $file = "$Path/$Nombre_Ejecutable-".$size."-Hilos-".$hilo.".dat"; #Se deinfe la variable con el nombre del archivo en el 
		#que se escribiran los datos basado en el ejecutable, tamaño de matriz y numero de hilos
	
            for ($i = 0; $i < $Repeticiones; $i++) { #Ciclo for en el cual se ejecutaran las instrucciones basado en el numero de repeticiones

                system("$Path/$Nombre_Ejecutable $size $hilo  >> $file"); #Ejecución del comando con su ejecutable, tamaño de matriz y numero de hilos
                #printf("$Path/$Nombre_Ejecutable $size $hilo \n"); #Imprimir comando ejecutado
            }

            close($file); #Cerrar el archivo ejecutable

            $p = $p + 1;
        }
    }
}


