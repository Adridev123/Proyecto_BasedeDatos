using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MiPrimerJuego
{
    using Microsoft.Xna.Framework;

    public class PilaManual
    {
        private Rectangle[] elementos;
        private int tope;

        public PilaManual(int capacidad)
        {
            elementos = new Rectangle[capacidad];
            tope = -1;
        }

        public int Cantidad
        {
            get { return tope + 1; }
        }

        public bool Push(Rectangle elemento)
        {
            if (tope == elementos.Length - 1)
                return false;

            tope++;
            elementos[tope] = elemento;

            return true;
        }

        public bool Pop(out Rectangle elemento)
        {
            if (tope == -1)
            {
                elemento = default;
                return false;
            }

            elemento = elementos[tope];
            tope--;

            return true;
        }
    }

    public class ColaCircular<T>
    {
        private T[] datos;
        private int frente = 0;
        private int fin = 0;
        private int cantidad = 0;

        public int Cantidad => cantidad;

        public ColaCircular(int capacidad)
        {
            datos = new T[capacidad];
        }

        public void Encolar(T item)
        {
            if (cantidad == datos.Length)
                throw new InvalidOperationException("Cola llena");

            datos[fin] = item;
            fin = (fin + 1) % datos.Length;
            cantidad++;
        }

        public T Desencolar()
        {
            if (cantidad == 0)
                throw new InvalidOperationException("Cola vacía");

            T item = datos[frente];
            frente = (frente + 1) % datos.Length;
            cantidad--;
            return item;
        }

        public T this[int i] => datos[(frente + i) % datos.Length];
    }
}
