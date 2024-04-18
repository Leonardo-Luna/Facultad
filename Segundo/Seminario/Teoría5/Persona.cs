namespace p5
{

    public class Persona
    {

        private string Nombre { get; set; }
        private char Sexo { get; set; }
        private int DNI { get; set; }
        private DateTime FechaNacimiento { get; set; }
        private int Edad 
        { 
            get { return Edad; } //Preguntar por qué me obliga a ponerle cuerpo al get 
            set { Edad = DateTime.Now.Year - FechaNacimiento.Year; } 
        }

        public object? this[int i]
        {
            
            set
            {

                switch(i)
                {

                    case 1: this.Nombre = (string)value;
                            break;

                    case 2: this.Sexo = (char)value;
                            break;

                    case 3: this.DNI = (int)value;
                            break;

                    case 4: break;

                }

            }

        }

    }

}