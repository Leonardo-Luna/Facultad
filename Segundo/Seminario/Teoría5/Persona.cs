using System.Reflection.Metadata.Ecma335;

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
            get { return DateTime.Now.Year - FechaNacimiento.Year; }
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

                    case 4: this.FechaNacimiento = (DateTime)value;
                            break;
                    
                    default: break;

                }

            }

            get{

                switch(i)
                {

                    case 1: return this.Nombre;

                    case 2: return this.Sexo;

                    case 3: return this.DNI;

                    case 4: return this.FechaNacimiento;

                    case 5: return this.Edad;

                    default: throw new IndexOutOfRangeException("Flasheaste");

                }

            }

        }

    }

}