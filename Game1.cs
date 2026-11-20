using Microsoft.Xna.Framework;
using Microsoft.Xna.Framework.Graphics;
using Microsoft.Xna.Framework.Input;
using System;
using System.Collections.Generic;
using System.Reflection.Metadata.Ecma335;

namespace MiPrimerJuego
{
    public class Game1 : Game
    {

        private Texture2D personaje;
        private Texture2D personajeIzq;
        private Texture2D Pantallavictoria;
        private Texture2D perdida;
        private Texture2D enemigo;
        private Texture2D puerta;
        private Vector2 posicion;
        private float velocidad = 200f;
        private List<Pared> paredes = new List<Pared>();
        private List<ParedDiagonal> paredesDiagonales = new List<ParedDiagonal>();
        private PilaManual historialChoques = new PilaManual(20);

        private Texture2D pixel;
        private SpriteFont fuente;
        private int vidas = 3;
        private int puntaje = 0;
        private Texture2D fondo;
        private Rectangle meta;
        private bool perdidabool = false;
        private bool victoria = false;
        private Obstaculo[] obstaculos;



        Random random = new Random();
        private GraphicsDeviceManager _graphics;
        private SpriteBatch _spriteBatch;
        KeyboardState tecladoAnterior;
        const int anchoVirtual = 1920;
        const int altoVirtual = 1080;
        Keys ultimaHorizontal;
        Keys ultimaVertical;

        public Game1()
        {
            _graphics = new GraphicsDeviceManager(this);
            Content.RootDirectory = "Content";
            IsMouseVisible = true;
            _graphics.IsFullScreen = false;

            _graphics.PreferredBackBufferWidth = 1280;
            _graphics.PreferredBackBufferHeight = 720;
            _graphics.ApplyChanges();

        }

        protected override void Initialize()
        {
            // TODO: Add your initialization logic here

            base.Initialize();
        }

        protected override void LoadContent()
        {

            _spriteBatch = new SpriteBatch(GraphicsDevice);

            // TODO: use this.Content to load your game content here

            personaje = Content.Load<Texture2D>("personaje");
            enemigo = Content.Load<Texture2D>("Enemigo");
            puerta = Content.Load<Texture2D>("Puerta");
            Pantallavictoria = Content.Load<Texture2D>("Victoria");
            perdida = Content.Load<Texture2D>("Perdida");
            posicion = new Vector2(0, 0);
            fondo = Content.Load<Texture2D>("fondo");
            fuente = Content.Load<SpriteFont>("Arial");
            pixel = new Texture2D(GraphicsDevice, 1, 1);
            pixel.SetData(new[] { Color.White });


            paredes.Add(new Pared(0, 150, 300, 40));
            paredes.Add(new Pared(1397, 319, 300, 40));
            paredes.Add(new Pared(500, 200, 120, 300));
            paredes.Add(new Pared(200, 400, 120, 250));
            paredes.Add(new Pared(800, 400, 120, 250));
            paredes.Add(new Pared(200, 620, 1720, 50));
            paredes.Add(new Pared(0, 750, 1620, 50));

            paredesDiagonales.Add(new ParedDiagonal(new Vector2(297, 169), new Vector2(1400, 339), 40));

            meta = new Rectangle(75, 900, 100, 200);

            obstaculos = new Obstaculo[26];

            obstaculos[0] = new Obstaculo(1697, 329, 20, 20);
            obstaculos[0].Mover(210, 0, 300f);
            obstaculos[1] = new Obstaculo(300, 190, 50, 50);
            obstaculos[1].Mover(180, 370, 200f);
            obstaculos[2] = new Obstaculo(750, 250, 50, 50);
            obstaculos[2].Mover(-170, 320, 200f);
            obstaculos[3] = new Obstaculo(400, 640, 20, 20);
            obstaculos[3].Mover(0, 125, 80f);
            obstaculos[4] = new Obstaculo(600, 640, 20, 20);
            obstaculos[4].Mover(0, 125, 100f);
            obstaculos[5] = new Obstaculo(800, 640, 20, 20);
            obstaculos[5].Mover(0, 125, 80f);
            obstaculos[6] = new Obstaculo(1000, 640, 20, 20);
            obstaculos[6].Mover(0, 125, 100f);
            obstaculos[7] = new Obstaculo(1200, 640, 20, 20);
            obstaculos[7].Mover(0, 125, 80f);
            obstaculos[8] = new Obstaculo(1400, 640, 20, 20);
            obstaculos[8].Mover(0, 125, 100f);
            obstaculos[9] = new Obstaculo(1600, 640, 20, 20);
            obstaculos[9].Mover(0, 125, 80f);

            obstaculos[10] = new Obstaculo(400, 880, 20, 20);
            obstaculos[11] = new Obstaculo(400, 960, 20, 20);
            obstaculos[12] = new Obstaculo(400, 1040, 20, 20);


            obstaculos[13] = new Obstaculo(800, 800, 20, 20);

            obstaculos[14] = new Obstaculo(800, 960, 20, 20);
            obstaculos[15] = new Obstaculo(800, 1040, 20, 20);


            obstaculos[16] = new Obstaculo(1200, 800, 20, 20);
            obstaculos[17] = new Obstaculo(1200, 880, 20, 20);

            obstaculos[18] = new Obstaculo(1200, 1040, 20, 20);

            obstaculos[19] = new Obstaculo(1600, 800, 20, 20);
            obstaculos[20] = new Obstaculo(1600, 880, 20, 20);
            obstaculos[21] = new Obstaculo(1600, 960, 20, 20);



            obstaculos[22] = new Obstaculo(400, 800, 20, 20);
            obstaculos[22].Mover(1520, 0, 200f);
            obstaculos[23] = new Obstaculo(400, 880, 20, 20);
            obstaculos[23].Mover(1520, 0, 200f);
            obstaculos[24] = new Obstaculo(400, 960, 20, 20);
            obstaculos[24].Mover(1520, 0, 200f);
            obstaculos[25] = new Obstaculo(400, 1040, 20, 20);
            obstaculos[25].Mover(1520, 0, 200f);

        }

        protected override void Update(GameTime gameTime)
        {
            if (GamePad.GetState(PlayerIndex.One).Buttons.Back == ButtonState.Pressed || Keyboard.GetState().IsKeyDown(Keys.Escape))
                Exit();
            KeyboardState teclado = Keyboard.GetState();
            Vector2 posicionAnterior = posicion;
            float tiempo = (float)gameTime
                .ElapsedGameTime.TotalSeconds;

            foreach (Obstaculo o in obstaculos)
                o.Actualizar(tiempo);


            if (teclado.IsKeyDown(Keys.A) && tecladoAnterior.IsKeyUp(Keys.A))
                ultimaHorizontal = Keys.A;

            if (teclado.IsKeyDown(Keys.D) && tecladoAnterior.IsKeyUp(Keys.D))
                ultimaHorizontal = Keys.D;

            if (teclado.IsKeyDown(Keys.W) && tecladoAnterior.IsKeyUp(Keys.W))
                ultimaVertical = Keys.W;

            if (teclado.IsKeyDown(Keys.S) && tecladoAnterior.IsKeyUp(Keys.S))
                ultimaVertical = Keys.S;

            if (teclado.IsKeyDown(Keys.A) && !teclado.IsKeyDown(Keys.D))
            {
                posicion.X -= velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;
                personaje = Content.Load<Texture2D>("personajeIzq");
            }

            else if (teclado.IsKeyDown(Keys.D) && !teclado.IsKeyDown(Keys.A))
            {
                posicion.X += velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;
                personaje = Content.Load<Texture2D>("personaje");
            }

            else if (teclado.IsKeyDown(Keys.A) && teclado.IsKeyDown(Keys.D))
            {
                if (ultimaHorizontal == Keys.A)
                {
                    posicion.X -= velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;
                    personaje = Content.Load<Texture2D>("personajeIzq");
                }
                else if (ultimaHorizontal == Keys.D)
                {
                    posicion.X += velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;
                    personaje = Content.Load<Texture2D>("personaje");
                }
            }


            if (teclado.IsKeyDown(Keys.W) && !teclado.IsKeyDown(Keys.S))
                posicion.Y -= velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;

            else if (teclado.IsKeyDown(Keys.S) && !teclado.IsKeyDown(Keys.W))
                posicion.Y += velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;

            else if (teclado.IsKeyDown(Keys.W) && teclado.IsKeyDown(Keys.S))
            {
                if (ultimaVertical == Keys.W)
                    posicion.Y -= velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;

                else if (ultimaVertical == Keys.S)
                    posicion.Y += velocidad * (float)gameTime.ElapsedGameTime.TotalSeconds;
            }

            if (teclado.IsKeyDown(Keys.LeftShift))
            {
                velocidad = 400f;
            }
            else
            {
                velocidad = 200f;
            }

            if (teclado.IsKeyDown(Keys.Space) && tecladoAnterior.IsKeyUp(Keys.Space))
            {
            }

            if (teclado.IsKeyDown(Keys.F11) && tecladoAnterior.IsKeyUp(Keys.F11))
            {
                _graphics.IsFullScreen = !_graphics.IsFullScreen;
                if (_graphics.IsFullScreen)
                {
                    _graphics.PreferredBackBufferWidth = GraphicsAdapter.DefaultAdapter.CurrentDisplayMode.Width;
                    _graphics.PreferredBackBufferHeight = GraphicsAdapter.DefaultAdapter.CurrentDisplayMode.Height;
                }
                else
                {
                    _graphics.PreferredBackBufferWidth = 1280;
                    _graphics.PreferredBackBufferHeight = 720;
                }

                _graphics.ApplyChanges();
            }

            posicion.X = MathHelper.Clamp(posicion.X, 0, anchoVirtual - (personaje.Width * 3) / 10);
            posicion.Y = MathHelper.Clamp(posicion.Y, 0, altoVirtual - (personaje.Height * 3) / 10);

            int anchoPj2 = ((personaje.Width * 3) - 20) / 10;
            int altoPj2 = ((personaje.Height * 3) - 20) / 10;

            Vector2 mitad = new Vector2(anchoPj2 / 2f, altoPj2 / 2f);
            Vector2 centro = posicion + mitad;
            float radio = Math.Min(anchoPj2, altoPj2) / 2f;

            foreach (ParedDiagonal pd in paredesDiagonales)
            {
                Vector2 cercano = pd.PuntoMasCercano(centro);
                Vector2 diferencia = centro - cercano;
                float distancia = diferencia.Length();
                float minimo = radio + pd.Grosor / 2f;

                if (distancia < minimo && distancia > 0f)
                {
                    centro += diferencia / distancia * (minimo - distancia);
                }
            }

            posicion = centro - mitad;

            int anchoPj = ((personaje.Width * 3) - 20) / 10;
            int altoPj = ((personaje.Height * 3) - 20) / 10;

            Rectangle rectX = new Rectangle((int)posicion.X, (int)posicionAnterior.Y, anchoPj, altoPj);
            foreach (Pared pared in paredes)
            {
                if (rectX.Intersects(pared.Area))
                {
                    posicion.X = posicionAnterior.X;
                    break;
                }
            }

            Rectangle rectY = new Rectangle((int)posicion.X, (int)posicion.Y, anchoPj, altoPj);
            foreach (Pared pared in paredes)
            {
                if (rectY.Intersects(pared.Area))
                {
                    posicion.Y = posicionAnterior.Y;
                    break;
                }
            }

            tecladoAnterior = teclado;

            Rectangle areaPersonaje = new Rectangle(
                (int)posicion.X,
                (int)posicion.Y,
                ((personaje.Width * 3) - 20) / 10,
                ((personaje.Height * 3) - 20) / 10
            );
            if (victoria)
            {
                if (Keyboard.GetState().IsKeyDown(Keys.Escape))
                    Exit();

                base.Update(gameTime);
                return;
            }
            if (areaPersonaje.Intersects(meta))
            {
                victoria = true;
            }

            for (int i = 0; i < obstaculos.Length; i++)
            {
                Obstaculo obstaculo = obstaculos[i];

                if (!obstaculo.Activo)
                    continue;

                if (areaPersonaje.Intersects(obstaculo.Area))
                {
                    vidas--;

                    historialChoques.Push(obstaculo.Area);

                    obstaculo.Activo = false;
                }
            }
            if (vidas == 0)
            {
                perdidabool = true;
            }
            base.Update(gameTime);
        }

        protected override void Draw(GameTime gameTime)
        {
            GraphicsDevice.Clear(Color.CornflowerBlue);

            // TODO: Add your drawing code here

            GraphicsDevice.Clear(Color.Black);

            int anchoReal = GraphicsDevice.PresentationParameters.BackBufferWidth;
            int altoReal = GraphicsDevice.PresentationParameters.BackBufferHeight;

            float escala = Math.Min((float)anchoReal / anchoVirtual, (float)altoReal / altoVirtual);

            float offsetX = (anchoReal - anchoVirtual * escala) / 2f;
            float offsetY = (altoReal - altoVirtual * escala) / 2f;

            Matrix transformacion =
                Matrix.CreateScale(escala, escala, 1f) *
                Matrix.CreateTranslation(offsetX, offsetY, 0f);

            _spriteBatch.Begin(transformMatrix: transformacion);

            _spriteBatch.Draw(
                fondo,
                new Rectangle(0, 0, 1920, 1080),
                Color.White
            );

            foreach (Pared pared in paredes)
            {
                _spriteBatch.Draw(pixel, pared.Area, new Color(231, 210, 111));
            }

            foreach (ParedDiagonal pd in paredesDiagonales)
            {
                Vector2 dir = pd.B - pd.A;
                float angulo = (float)Math.Atan2(dir.Y, dir.X);

                _spriteBatch.Draw(
                    pixel,
                    pd.A,
                    null,
                    new Color(231, 210, 111),
                    angulo,
                    new Vector2(0, 0.5f),
                    new Vector2(dir.Length(), pd.Grosor),
                    SpriteEffects.None,
                    0f
                );
            }

            foreach (Obstaculo obstaculo in obstaculos)
            {
                if (obstaculo.Activo)
                {
                    _spriteBatch.Draw(
                        enemigo,
                        new Vector2(obstaculo.Area.X, obstaculo.Area.Y),
                        null,
                        Color.White,
                        0f,
                        Vector2.Zero,
                        0.25f,
                        SpriteEffects.None,
                        0f
                    );
                }
            }

            _spriteBatch.Draw(
                personaje,
                posicion,
                null,
                Color.White,
                0f,
                Vector2.Zero,
                0.3f,
                SpriteEffects.None,
                0f
            );


            // Dibujar vidas
            _spriteBatch.DrawString(
                fuente,
                "Vidas: " + vidas,
                new Vector2(10, 10),
                Color.Black,
                0f,
                Vector2.Zero,
                3f,
                SpriteEffects.None,
                0f
            );

            _spriteBatch.Draw(puerta, new Rectangle(50, 900, 152, 186), Color.White);


            if (victoria)
            {
                _spriteBatch.Draw(Pantallavictoria, new Rectangle(0, 0, 1920, 1080), Color.White);
            }
            if (perdidabool)
            {
                _spriteBatch.Draw(perdida, new Rectangle(0, 0, 1920, 1080), Color.White);
            }

            _spriteBatch.End();



            base.Draw(gameTime);
        }
    }
}
