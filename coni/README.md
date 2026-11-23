# Accesos a edificios (Supabase + Google Maps + GitHub Pages)

## 1. Supabase
1. Creá un proyecto en https://supabase.com.
2. SQL Editor → pegá y ejecutá `schema.sql` (crea la tabla, restricciones, políticas y 3 ejemplos).
3. Project Settings → API: copiá **Project URL** y **anon public key**.

## 2. Google Maps
1. En Google Cloud Console creá un proyecto y activá **Maps JavaScript API** (requiere facturación activa).
2. Credentials → Create API key. Restringila por **HTTP referrers**: `https://TU-USUARIO.github.io/*` y `http://localhost:*`.

## 3. Configurar
Editá `config.js` con las tres claves.

## 4. Probar local
```bash
python3 -m http.server 8000   # abrir http://localhost:8000
```

## 5. GitHub
```bash
git init
git add .
git commit -m "Sistema de accesos con Supabase y Google Maps"
git branch -M main
git remote add origin https://github.com/TU-USUARIO/accesos-mapa.git
git push -u origin main
```
Luego en GitHub: Settings → Pages → Source: *Deploy from a branch* → `main` / root.
Tu sitio quedará en `https://TU-USUARIO.github.io/accesos-mapa/`.

## Notas
- Las políticas RLS de `schema.sql` son abiertas (modo práctica). Para uso real, exigí login con Supabase Auth.
- Validación: latitud −90..90 y longitud −180..180, tanto en el formulario como en la base (CHECK).
