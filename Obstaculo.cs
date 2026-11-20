using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Xna.Framework;

namespace MiPrimerJuego
{
    internal class Obstaculo
    {
        public Rectangle Area;
        public bool Activo;

        private Vector2 posicion;
        private Vector2 inicio;
        private Vector2 fin;
        private float velocidad;
        private int sentido = 1;

        public Obstaculo(int x, int y, int ancho, int alto)
        {
            Area = new Rectangle(x, y, ancho, alto);
            Activo = true;
            posicion = new Vector2(x, y);
            inicio = posicion;
            fin = posicion;
        }

        // Cuánto se mueve en X, en Y, y a qué velocidad. Va y vuelve.
        public void Mover(int dx, int dy, float velocidad)
        {
            inicio = posicion;
            fin = inicio + new Vector2(dx, dy);
            this.velocidad = velocidad;
        }

        public void Actualizar(float tiempo)
        {
            Vector2 destino = sentido == 1 ? fin : inicio;
            Vector2 resto = destino - posicion;
            float paso = velocidad * tiempo;

            if (resto.Length() <= paso)
            {
                posicion = destino;
                sentido = -sentido;
            }
            else
            {
                posicion += Vector2.Normalize(resto) * paso;
            }

            Area.X = (int)posicion.X;
            Area.Y = (int)posicion.Y;
        }
    }

    internal class Pared
    {
        public Rectangle Area;

        public Pared(int x, int y, int ancho, int alto)
        {
            Area = new Rectangle(x, y, ancho, alto);
        }
    }

    public class ParedDiagonal
    {
        public Vector2 A;
        public Vector2 B;
        public float Grosor;

        public ParedDiagonal(Vector2 a, Vector2 b, float grosor = 20f)
        {
            A = a;
            B = b;
            Grosor = grosor;
        }

        // Punto del segmento A-B más cercano a un punto p
        public Vector2 PuntoMasCercano(Vector2 p)
        {
            Vector2 ab = B - A;
            float t = Vector2.Dot(p - A, ab) / ab.LengthSquared();
            t = MathHelper.Clamp(t, 0f, 1f);
            return A + ab * t;
        }
    }

    public class HitboxGanar
    {
        private Rectangle meta;
    }
}
