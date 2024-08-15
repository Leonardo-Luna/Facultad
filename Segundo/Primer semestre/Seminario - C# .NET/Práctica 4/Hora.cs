using System.ComponentModel;

class Hora {

        private int hora {get;}
        private int minutos {get;}
        private float segundos {get;}

        public Hora(int h, int m, int s) {

            this.hora = h;
            this.minutos = m;
            this.segundos = s;

        }

        public Hora(double h) {

            hora = (int)h;
            h -= hora;
            h *= 60;
            minutos = (int)h;
            h -= minutos;
            h *= 60;
            segundos = (float)h;

        }

        public void imprimir() {

            Console.WriteLine($"{this.hora} horas, {this.minutos} minutos, {this.segundos} segundos");

        }

    }