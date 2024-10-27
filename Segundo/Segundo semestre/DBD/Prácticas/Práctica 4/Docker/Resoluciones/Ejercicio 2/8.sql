-- Eliminar el podador con DNI 22234566

DELETE FROM Podador WHERE DNI='22234566';

/*
El enunciado pide lo que está hecho arriba, eliminar el podador con el DNI especificado.
El problema? La tabla Poda tiene una Foreign Key "DNI" que hace referencia a la tabla Podador.

2 alternativas:
    
    1- Eliminar todas las Podas cuyo DNI sea el mismo que se desea eliminar

    2- Activar la eliminación en cascada y eliminar solo el Podador, haciendo que se elimine
    automáticamente sus Podas.

1:
    DELETE FROM Poda WHERE DNI='22234566';
    DELETE FROM Podador WHERE DNI='22234566';

2:
    ALTER TABLE Poda DROP FOREIGN KEY Poda_ibfk_1,
    ADD CONSTRAINT Poda_ibfk_1 FOREIGN KEY (DNI) REFERENCES Podador(DNI) ON DELETE CASCADE;
*/