# Repaso — Procedimientos

*Resumen que fui armando con lo que me pareció necesario para poder resolver todos los ejercicios del libro, parciales y finales viejos.*

*Hay algunos temas que están acá y no en el libro debido a que se dan en Matemática 0 o Matemática 1.*

---

## Límites determinados e indeterminados

$k,m$ = constantes distintas de cero. $f\to k$ significa que ese límite da el número $k$; $f\to\infty$ que tiende a infinito (con signo, según corresponda, aplicando regla de los signos igual que en una multiplicación/división común).

**Determinados** (el resultado se puede sacar directo, sin ninguna técnica extra):

| Forma | Resultado |
|---|---|
| $\dfrac{f\to k}{g\to0}$ | $\infty$ |
| $\dfrac{f\to k}{g\to\infty}$ | $0$ |
| $\dfrac{f\to\infty}{g\to0}$ | $\infty$ |
| $\dfrac{f\to k}{g\to m}$ | $k/m$ |
| $(f\to k)\cdot(g\to m)$ | $k\cdot m$ |
| $(f\to\infty)\cdot(g\to\infty)$ | $\infty$ |
| $(f\to k)\cdot(g\to\infty)$ | $\infty$ |
| $(f\to k)+(g\to\infty)$ | $\infty$ |
| $(f\to+\infty)+(g\to+\infty)$ | $+\infty$ |
| $(f\to-\infty)+(g\to-\infty)$ | $-\infty$ |
| $(f\to t)^{(g\to+\infty)}$, con $t>0$ | $+\infty$ |
| $(f\to t)^{(g\to-\infty)}$, con $t>0$ | $0$ |

**Indeterminados** (no se puede sacar el resultado directo — hay que "salvar la indeterminación" con alguna técnica: factor común, conjugado, L'Hôpital, etc.):

| Forma |
|---|
| $\dfrac{f\to0}{g\to0}$ |
| $\dfrac{f\to\infty}{g\to\infty}$ |
| $\dfrac{f\to0}{g\to0}$ (raíz u otra combinación que dé $0/0$) |
| $(f\to\infty)\cdot(g\to0)$ |
| $(f\to+\infty)-(g\to+\infty)$ |
| $(f\to+\infty)+(g\to-\infty)$ |
| $(f\to0)^{(g\to+\infty)}$ |
| $(f\to0)^{(g\to0)}$ |

---

## L'Hôpital (no está en el libro de la cátedra — puede haberse dado en clase)

**Para qué sirve:** resolver un límite de un **cociente** que da indeterminación $0/0$ o $\infty/\infty$, cuando las técnicas algebraicas (factor común, conjugado) no tienen forma clara de aplicarse — típico con logaritmos, exponenciales o trigonométricas mezcladas.

**Regla:** si $\lim_{x\to a}\dfrac{f(x)}{g(x)}$ da $0/0$ o $\infty/\infty$, entonces

$$\lim_{x\to a}\frac{f(x)}{g(x)} = \lim_{x\to a}\frac{f'(x)}{g'(x)}$$

(derivar numerador y denominador **por separado** — no es la derivada del cociente completo, no se usa la regla del cociente).

**Condición obligatoria:** verificar primero que efectivamente da $0/0$ o $\infty/\infty$. Si da, por ejemplo, $5/0$, no es indeterminación — es un límite infinito directo (tabla de determinados), y aplicar L'Hôpital ahí da un resultado incorrecto.

**Si un producto da forma $0\cdot\infty$** (no es cociente): primero hay que **transformarlo en cociente**, dividiendo uno de los factores como $1/(\text{recíproco})$. Ejemplo: $x\ln(x)$ (con $x\to0^+$) se reescribe como $\dfrac{\ln(x)}{1/x}$ — recién ahí se aplica L'Hôpital.

**Si sigue dando $0/0$ o $\infty/\infty$ después de aplicar la regla una vez**, se puede volver a aplicar (derivar de nuevo numerador y denominador), tantas veces como haga falta.

**Ejemplo completo:** $\displaystyle\lim_{x\to0^+} x\ln(x)$

1. Forma $0\cdot(-\infty)$ → reescribir como cociente: $\dfrac{\ln(x)}{1/x}$
2. Da $-\infty/+\infty$ → aplicar L'Hôpital: $f(x)=\ln x\to f'(x)=\frac1x$; $g(x)=\frac1x\to g'(x)=-\frac{1}{x^2}$
3. $\dfrac{1/x}{-1/x^2} = \dfrac1x\cdot(-x^2) = -x$
4. $\lim_{x\to0^+}(-x) = 0$

---

## Despejar x de $\ln(x)=k$

**Idea:** aplicar $e$ a ambos lados de la igualdad, usando que $e$ y $\ln$ son funciones inversas ($e^{\ln(u)}=u$).

$$\ln(x)=k \quad\Rightarrow\quad e^{\ln(x)}=e^k \quad\Rightarrow\quad x=e^k$$

**Procedimiento con una ecuación más larga:** primero aislar $\ln(x)$ solo con álgebra común (como si fuera cualquier incógnita), y recién ahí aplicar $e$.

**Ejemplo:** $2\ln(x)-3=7$

1. $2\ln(x)=10$ (sumando 3)
2. $\ln(x)=5$ (dividiendo por 2)
3. $x=e^5$ (aplicando $e$ a ambos lados)

**Cuándo NO funciona — ecuaciones trascendentes:** si la $x$ aparece en algún otro lugar de la ecuación además de adentro del logaritmo (ej. $\ln(x)=23x$, o $\ln(x)=x+2$), aplicar $e$ no despeja nada — la $x$ queda en ambos lados sin forma de aislarla ($x=e^{23x}$, $x=e^{x+2}$). Este tipo de ecuación no se resuelve con álgebra común en esta materia; si aparece buscando un cero o un punto crítico, es señal de revisar el planteo previo.

---

---

## Continuidad en un punto

1. $f(a)$ existe
2. $\lim_{x\to a}f(x)$ existe (laterales coinciden)
3. $\lim_{x\to a}f(x)=f(a)$

Si es **fórmula única** (una sola expresión para todo x, no una función a trozos): dominio = continuidad (por álgebra de funciones continuas).
Si es partida (función a trozos, con distinta fórmula según el valor de x): el **punto de pegado** es el valor de x donde cambia de una rama a otra (ej. si la función usa una fórmula para $x\geq3$ y otra para $x<3$, el punto de pegado es $x=3$). Ahí es donde chequear los 3 puntos de la definición, usando en cada lado la rama que corresponde.

**Evitable:** laterales coinciden, pero $f(a)$ no existe o no coincide.
**Inevitable:** laterales no coinciden.

---

## Continuidad en $[a,b]$

$[a,b]$ = intervalo completo, no dos puntos. Chequear el/los punto(s) de pegado que caigan **dentro**.

---

## Asíntotas

**Vertical** ($x=x_0$): existe si al menos uno de estos 4 límites da $+\infty$ o $-\infty$:
$$\lim_{x\to x_0^-}f(x) \quad \lim_{x\to x_0^+}f(x)$$

**Candidatos naturales:** los puntos que quedan fuera del dominio (donde se anula un denominador). No todo punto fuera del dominio es asíntota vertical — hay que confirmar que el límite (al menos uno de los laterales) tienda a infinito ahí.

**Horizontal** ($y=L$): existe si al menos uno de estos 2 límites da un número real $L$:
$$\lim_{x\to+\infty}f(x) \quad \lim_{x\to-\infty}f(x)$$

Puede haber una misma horizontal para ambos lados, una distinta para cada lado, o directamente ninguna (si el límite en el infinito no existe o es también infinito).

**Procedimiento:**
1. Ver dominio → cada punto excluido es candidato a vertical. Calcular los límites laterales ahí; si alguno da $\pm\infty$, confirmar la asíntota.
2. Calcular $\lim_{x\to+\infty}f(x)$ y $\lim_{x\to-\infty}f(x)$; si alguno da un número finito, esa es la asíntota horizontal (para ese lado).

---

## Derivada por definición

$$f'(x_0)=\lim_{h\to0}\frac{f(x_0+h)-f(x_0)}{h}$$

1. $f(x_0+h)$
2. $f(x_0)$
3. Armar cociente
4. Simplificar hasta cancelar $h$ (nunca reemplazar $h=0$ directo)
   - Polinomio → desarrollar potencia, factor común $h$
   - Raíz → multiplicar por conjugado
5. Recién ahí, límite $h\to0$

Partida en punto de pegado → laterales por separado, cada uno con su rama, deben coincidir.

---

## Propiedades de los logaritmos (útiles para simplificar antes de derivar o integrar)

| Propiedad | Fórmula |
|---|---|
| Logaritmo de un producto | $\ln(ab) = \ln a+\ln b$ |
| Logaritmo de un cociente | $\ln\left(\dfrac{a}{b}\right) = \ln a-\ln b$ |
| Logaritmo de una potencia | $\ln(a^n) = n\ln a$ |
| Logaritmo de $e$ elevado a algo | $\ln(e^u) = u$ (porque $\ln$ y $e^{(\cdot)}$ son funciones inversas) |

**Por qué conviene aplicarlas antes de derivar:** una expresión como $\ln\big((x^2+1)^3\cdot e^{\cos x}\big)$, sin simplificar, tiene varias capas de composición anidadas (producto adentro de una potencia adentro de un logaritmo) — aplicando primero $\ln(ab)=\ln a+\ln b$ y $\ln(a^n)=n\ln a$, se separa en una **suma** de términos mucho más simples:

$$\ln\big((x^2+1)^3\cdot e^{\cos x}\big) = 3\ln(x^2+1)+\ln(e^{\cos x}) = 3\ln(x^2+1)+\cos(x)$$

(el segundo término se simplificó del todo usando $\ln(e^u)=u$, sin necesidad de derivar ningún logaritmo ahí). Con esto ya reescrito como suma, cada término se deriva por separado con las reglas básicas — mucho más corto que aplicar cadena sobre la expresión completa sin simplificar.

---

## Reglas de derivación

| $f(x)$ | $f'(x)$ |
|---|---|
| $c$ | $0$ |
| $x^n$ | $nx^{n-1}$ |
| $e^x$ | $e^x$ |
| $\ln(x)$ | $1/x$ |
| $\text{sen}(x)$ | $\cos(x)$ |
| $\cos(x)$ | $-\text{sen}(x)$ |

| Operación | Regla |
|---|---|
| $cf$ | $cf'$ |
| $f\pm g$ | $f'\pm g'$ |
| $f\cdot g$ | $f'g+fg'$ |
| $f/g$ | $(f'g-fg')/g^2$ |
| $f(g(x))$ | $f'(g(x))\cdot g'(x)$ |

**Cómo elegir la regla:**
- ¿Hay algo elevado a una potencia, o adentro de una raíz? (ej. $(x^3+2x)^2$, $\sqrt{x^4+2x}$) → es una composición: pensar "externa" (la potencia/raíz) e "interna" (lo de adentro). Derivar la externa con regla de potencia dejando la interna intacta, y multiplicar por la derivada de la interna.
- ¿Es una fracción con algo más que un término simple arriba o abajo? → regla del cociente. Ojo: el numerador completo de la fórmula ($f'g-fg'$) va entre paréntesis antes de dividir por $g^2$ — no se puede simplificar una parte suelta contra el denominador.
- ¿Es dos funciones distintas multiplicándose? (ej. $x\cdot\text{sen}(x)$) → regla del producto.
- ¿Hay una función adentro de otra sin ser necesariamente una potencia? (ej. $e^{x^2+1}$, $\ln(x-4)$) → regla de la cadena: derivar la de afuera, multiplicar por la derivada de la de adentro.

---

## Recta tangente

$$y-f(x_0)=f'(x_0)(x-x_0)$$

$x_0$ fijo (se reemplaza), $x,y$ libres (no se tocan).

1. $x_0$ del punto
2. $f(x_0)$
3. $f'(x)$ general → evaluar en $x_0$ = pendiente
4. Reemplazar, despejar $y$

**Dada pendiente $m$:** $f'(x)=m$ → resolver x (cuadrática = posible ±2 soluciones) → por cada $x_i$, $f(x_i)$ y armar recta.

**Qué dice sobre crecimiento:** lo que indica si $f$ crece o decrece en $x_0$ es la **pendiente** $f'(x_0)$ (positiva=crece, negativa=decrece) — no la ordenada al origen de la recta tangente. La ordenada al origen (el $b$ de $y=mx+b$, donde la recta cruza el eje $y$) es solo un dato de posición, sin relación con el crecimiento de $f$.

---

## Derivadas de orden superior

$f''$ = derivar $f'$. Para existencia en punto de pegado: mismo esquema de laterales, pero sobre $f'$.

Atajo: evaluar fórmula de cada rama de $f'$ en el punto — si coinciden, candidato fuerte; si no, ya se sabe que no existe.

---

## Puntos críticos

**Definición:** $x_0$ es punto crítico de $f$ si $x_0$ está en el dominio de $f$ y además $f'(x_0)=0$ (la pendiente de la tangente ahí es cero) **o** $f'(x_0)$ no existe.

**Condición clave para el caso "no existe":** tiene que ser un punto que **sí está en el dominio de $f$, pero no en el de $f'$** (ej. un punto de pegado donde las derivadas laterales no coinciden). Un punto que ya está fuera del dominio de $f$ (y por lo tanto también fuera del de $f'$) **no es** candidato — queda descartado directamente, no cuenta como punto crítico.

Son los únicos candidatos a máximo o mínimo relativo — pero no toda función con $f'(x_0)=0$ tiene ahí un extremo (ej. $f(x)=x^3$ en $x=0$: derivada cero, pero la función crece en todo su dominio, sin extremo ahí). Hay que verificar con el criterio de la primera derivada (más abajo).

---

## Extremos absolutos en $[a,b]$ (Weierstrass)

Weierstrass garantiza que toda función continua en un intervalo **cerrado** $[a,b]$ alcanza un máximo y un mínimo absolutos ahí. Tiene que ser cerrado (ambos extremos incluidos) porque en uno abierto el candidato natural a extremo puede caer justo en el borde excluido, y entonces no llegás nunca a evaluarlo ahí (ej. $f(x)=x$ en $(0,1)$ no tiene máximo: por más cerca de 1 que te acerques, siempre hay un valor más grande todavía dentro del intervalo, porque el 1 mismo no está incluido).

1. Puntos críticos **dentro** de $(a,b)$
2. Evaluar $f$ en esos puntos **y en** $a,b$
3. Mayor = máx absoluto, menor = mín absoluto

---

## Crecimiento/decrecimiento

1. Puntos críticos de $f'$ (incluir bordes de dominio)
2. Armar intervalos
3. VP en cada uno, evaluar $f'$
4. $f'>0$ crece, $f'<0$ decrece

---

## Extremos relativos (criterio 1ra derivada)

Reutiliza la misma tabla de VP de "Crecimiento/decrecimiento" — no hace falta recalcular nada nuevo. Para cada punto crítico $c$, mirar el signo de $f'$ en el intervalo inmediatamente a la izquierda y en el de la derecha (los VP que ya evaluaste):

- izquierda negativa → derecha positiva: **mínimo**
- izquierda positiva → derecha negativa: **máximo**
- mismo signo a los dos lados (sin cambio): **no hay extremo** ahí, aunque sea punto crítico

---

## Concavidad

*Corresponde a los pasos g) y h) del análisis completo del libro.*

1. Calcular $f''(x)$
2. **Candidatos a punto de inflexión** (segunda parte del paso g): buscar dónde $f''(x)=0$ o no existe (dentro del dominio de $f$)
3. Armar intervalos con esos candidatos, VP en cada uno, evaluar $f''$ (paso h)
4. $f''>0$ cóncava arriba, $f''<0$ cóncava abajo

---

## Inflexión

*Corresponde al paso i) del libro — la confirmación final, después de calcular la concavidad en h).*

Candidato a punto de inflexión (los valores donde $f''=0$ o no existe, calculados en la sección de Concavidad) + cambio de signo confirmado de $f''$ a los dos lados.

**No confundir con "punto de pegado":** el punto de pegado es donde una función *a trozos* cambia de rama/fórmula (un tema de cómo está definida la función). El punto de inflexión es donde la concavidad cambia de signo (un tema de la forma de la curva). Una función puede ser una fórmula única (sin ningún pegado) y aun así tener puntos de inflexión, y un punto de pegado no es automáticamente un punto de inflexión (ni al revés).

---

## Análisis completo — orden

Dominio → continuidad → crec/decrec (f') → extremos relativos → concavidad (f'') → inflexión → **cuadro resumen con TODOS los puntos de corte juntos** (dominio + f' + f'') → gráfica.

---

## Anexo — Análisis completo de una función (pasos según el libro)

a) Determinar el **dominio** de la función.

b) Determinar el conjunto donde la función es **continua**. Donde sea discontinua, **clasificar** sus discontinuidades (evitable/inevitable).

c) Determinar las **asíntotas verticales y horizontales** (ver sección "Asíntotas" arriba).

d) Calcular la **primera derivada** y determinar los **puntos críticos**.

e) Determinar los **intervalos de crecimiento/decrecimiento**.

f) Determinar los **máximos y mínimos relativos**.

g) Calcular la **segunda derivada** y determinar dónde $f''(x)=0$ o no existe.

h) Determinar los **intervalos de concavidad**.

i) Determinar si la función presenta **puntos de inflexión**.

**Cuadro resumen** (se arma antes de graficar, combinando todos los puntos de corte — dominio, ceros de $f'$ y ceros de $f''$ — como se explica en "Análisis completo — orden" arriba):

| Intervalo | ... | ... | ... | ... |
|---|---|---|---|---|
| **VP** | valor de prueba | | | |
| **Signo de $f'(x)$** | + o − | | | |
| **Crec./Decrec. de f(x)** | crece / decrece | | | |
| **Signo de $f''(x)$** | + o − | | | |
| **Concavidad de f(x)** | cóncava h/arriba o h/abajo | | | |

Una columna por cada intervalo de la partición final (los que salen de unir todos los puntos de corte).

j) Realizar la **representación gráfica**, usando todos los datos de los puntos anteriores (incluido el cuadro resumen).

**Nota:** el orden a-j es el que da el libro.

---

## Linealidad (aplica a indefinidas y definidas por igual)

$$\int[c_1f(x)\pm c_2g(x)]\,dx = c_1\int f(x)\,dx \pm c_2\int g(x)\,dx$$

La integral de una suma/resta se reparte en la suma/resta de las integrales, y las constantes que multiplican salen afuera — igual que la derivada. Vale tanto si la integral tiene límites (definida) como si no (indefinida).

**Ejemplo:** $\displaystyle\int(5+3x)\,dx = \int5\,dx+\int3x\,dx = 5x + 3\cdot\frac{x^2}{2}+C = 5x+\frac{3x^2}{2}+C$

En la práctica no hace falta escribir el paso de separar en dos integrales — se aplica directo, resolviendo cada término de la suma con la tabla de integrales inmediatas (más abajo), como ya venías haciendo en los ejercicios de derivada término a término.

---

## Integral definida — propiedades

**Por qué sirven:** permiten resolver una integral sin calcular ninguna primitiva, combinando datos que ya te dan de otras integrales relacionadas.

- **Aditiva de intervalos:** $a<c<b \Rightarrow \int_a^b=\int_a^c+\int_c^b$ — recorrer de $a$ a $b$ es lo mismo que recorrer primero de $a$ a $c$ y después de $c$ a $b$ (partir el "camino" en tramos consecutivos).
- **Invertir los límites:** $\displaystyle\int_a^b f(x)\,dx = -\int_b^a f(x)\,dx$ — si los límites vienen "al revés" (el mayor arriba, el menor abajo, como $\int_8^5$), se pueden dar vuelta (quedando el menor abajo y el mayor arriba, el orden habitual), agregando un signo menos afuera. Útil cuando un dato o un planteo intermedio te deja los límites invertidos y necesitás reordenarlos para aplicar otra propiedad (como aditividad, que pide $a<c<b$ en orden).
- **Variable muda:** $\int f(t)dt=\int f(z)dz$ — el nombre de la variable de integración no afecta el resultado, porque desaparece al evaluar entre los límites.

**Con datos parciales:** ordenar los límites (los que aparecen en los datos y en la incógnita) de menor a mayor → eso dice cómo armar la ecuación de aditividad (tramo menor-a-medio + tramo medio-a-mayor = tramo total) → despejar la incógnita con álgebra común, según qué dato falte.

**Caso típico — dos integrales que comparten un límite:** por ejemplo, si te dan $\int_a^c f\,dx$ y $\int_b^c f\,dx$ (ambas terminan en $c$, pero empiezan distinto), y te piden $\int_a^b f\,dx$. Se resuelve igual: ordenás los tres valores ($a<b<c$), armás la aditividad con el del medio ($b$) como punto de corte —

$$\int_a^c f\,dx = \int_a^b f\,dx + \int_b^c f\,dx$$

— y despejás la incógnita restando el otro lado:

$$\int_a^b f\,dx = \int_a^c f\,dx - \int_b^c f\,dx$$

Es la resta de "el total conocido" menos "la parte conocida que sobra", igual que cuando los datos vienen con un límite compartido en el medio en vez de en el extremo.

**Barrow** — cómo se calcula en la práctica una integral definida, una vez que tenés la primitiva $F$:

$$\int_a^b f(x)\,dx=F(b)-F(a)$$

**Notación del paso intermedio:** entre calcular $F(x)$ y restar los valores, se escribe $F(x)$ entre corchetes con los límites como subíndice/superíndice a la derecha — eso es "F evaluada entre $a$ y $b$", el paso previo a hacer la resta:

$$\int_a^b f(x)\,dx = \Big[F(x)\Big]_a^b = F(b)-F(a)$$

**Ejemplo:** $\displaystyle\int_0^2 3x^2\,dx$. Primitiva: $F(x)=x^3$ (sin $+C$ en la definida, porque se cancela al restar). Entonces:

$$\int_0^2 3x^2\,dx = \Big[x^3\Big]_0^2 = 2^3-0^3 = 8-0 = 8$$

El corchete con $a$ (abajo) y $b$ (arriba) es el lugar donde "aparcás" la primitiva ya calculada, antes de reemplazar y restar.

---

## Integrales inmediatas

**De dónde salen:** cada una es la regla de derivación correspondiente, leída al revés (integrar deshace derivar). Por eso no hace falta memorizarlas aparte de las reglas de derivación.

| $\int$ | resultado | viene de derivar... |
|---|---|---|
| $k\,dx$ (con $k$ un número dado, ej. 5) | $kx+C$ | $(kx)'=k$ |
| $x^n dx$ ($n\neq-1$) | $\dfrac{x^{n+1}}{n+1}+C$ | $\left(\dfrac{x^{n+1}}{n+1}\right)'=x^n$ |
| $x^{-1}dx$ | $\ln\lvert x\rvert+C$ | $(\ln x)'=1/x$ (caso especial: la regla de potencia de arriba falla en $n=-1$ por división por 0) |
| $e^x dx$ | $e^x+C$ | $(e^x)'=e^x$ |
| $\text{sen}(x)dx$ | $-\cos(x)+C$ | $(-\cos x)'=\text{sen}(x)$ |
| $\cos(x)dx$ | $\text{sen}(x)+C$ | $(\text{sen}\,x)'=\cos(x)$ |

**Ojo con la letra:** el $k$ de la primera fila es un número que **ya viene dado** en el ejercicio (parte del enunciado, ej. $\int 5\,dx$) — no tiene nada que ver con la $C$ que se agrega siempre al final de toda integral indefinida. Son dos constantes distintas: $k$ es el dato conocido, $C$ es la incógnita genérica que aparece porque cualquier número sumado tiene derivada 0 y "se pierde" al derivar, así que hay que restituirla al integrar (por eso ya está sumada en cada fila de la tabla, no hace falta agregarla aparte).

---

## Sustitución

**Cuándo usarla:** cuando la integral tiene algo complicado "adentro" de otra cosa (una potencia, una raíz, un exponente) y en algún lado aparece multiplicando algo parecido a la derivada de esa parte complicada — la sustitución la convierte en una integral inmediata en la variable nueva.

1. $u$ = parte de adentro (complicada)
2. $du=u'(x)dx$ (nunca "du=número solo" — siempre lleva su $dx$)
3. Si queda x suelta fuera de la parte sustituida, despejarla en función de u también (de la misma ecuación $u=\ldots$)
4. Reescribir toda la integral en términos de u, sin ninguna x suelta, y resolver con las reglas de la tabla de arriba
5. Volver a x, reemplazando u por su expresión original
6. Definida: Barrow con límites originales (en x, tras volver) o cambiar los límites a valores de u y evaluar ahí directo — dan lo mismo

Señal para reconocerla en un cociente: si el numerador coincide (reordenado) con la derivada del denominador → la sustitución $u=$denominador da directo $\int\frac1u du=\ln|u|$.

**Ejemplo completo** (caso con $x$ suelta, el más largo de los dos tipos): $\displaystyle\int x\sqrt{x-1}\,dx$

1. $u=x-1$ (lo de adentro de la raíz)
2. $du=dx$ (derivada de $x-1$ es 1)
3. Queda una $x$ suelta afuera de la raíz — despejarla de la misma ecuación: $x=u+1$
4. Reescribir todo en $u$: $\displaystyle\int(u+1)\sqrt{u}\,du = \int(u+1)u^{1/2}\,du = \int\big(u^{3/2}+u^{1/2}\big)\,du = \frac{2}{5}u^{5/2}+\frac23u^{3/2}+C$
5. Volver a $x$ (recordando $u=x-1$): $\dfrac25(x-1)^{5/2}+\dfrac23(x-1)^{3/2}+C$

**Caso más simple** (sin $x$ suelta, cuando el numerador ya es la derivada de la parte de adentro): $\displaystyle\int 2x\,e^{x^2}\,dx$. Acá $u=x^2$, $du=2x\,dx$ — el $2x$ de la integral **es exactamente** $du$, así que se reemplaza directo sin necesidad de despejar ninguna $x$ suelta: $\displaystyle\int e^u\,du=e^u+C=e^{x^2}+C$.

---

## Integración por partes

**De dónde sale:** de integrar la regla de derivación del producto, $(fg)'=f'g+fg'$, en ambos lados, y despejar una de las dos integrales resultantes.

$$\int f\,g'\,dx = fg-\int g\,f'\,dx$$

**Cuándo usarla:** producto de dos funciones de tipo distinto que sustitución no resuelve directo (polinomio×ln, polinomio×exponencial, polinomio×trigonométrica).

1. Elegir $u$ (conviene que sea la parte que se simplifica al derivar: ln, x, $x^n$) y $dv$ (la parte fácil de integrar: $e^xdx$, $\text{sen}(x)dx$, etc.) — **la elección importa**: si se elige al revés, $\int dv$ puede no ser inmediata, o la integral nueva puede complicarse en vez de simplificarse.
2. Calcular $du$ (derivando $u$) y $v$ (integrando $dv$)
3. Reemplazar en la fórmula: $uv-\int v\,du$
4. Resolver $\int v\,du$ (puede necesitar partes de nuevo, si sigue siendo un producto complicado)

---

## Fracciones simples (no está en el libro de la cátedra — aparece en exámenes igual)

**Cuándo usarla:** cuando la integral es una fracción con un polinomio **factorizable** en el denominador (grado 2 o más, con raíces reales distintas) y algo más simple (constante o polinomio de menor grado) en el numerador — y ni sustitución ni partes la resuelven directo. Señal típica: $\displaystyle\int\frac{(\text{algo simple})}{(x-r_1)(x-r_2)}\,dx$, o una fracción que factoriza a esa forma.

**Idea de fondo:** una fracción con denominador factorizado en dos partes se puede **separar** en la suma de dos fracciones más simples, una con cada factor como denominador — el proceso inverso de "sumar fracciones con común denominador" que ya conocés.

**Procedimiento**, con ejemplo $\displaystyle\int\frac{x+8}{x^2+x-6}\,dx$:

**Paso 1 — Factorizar el denominador.** $x^2+x-6=(x+3)(x-2)$ (con Bhaskara o tanteo, buscando las raíces).

**Paso 2 — Plantear la descomposición**, con una constante desconocida por cada factor:

$$\frac{x+8}{(x+3)(x-2)} = \frac{A}{x+3}+\frac{B}{x-2}$$

**Paso 3 — Despejar A y B.** Multiplicás **ambos lados completos** de la igualdad por $(x+3)(x-2)$, para sacarte las fracciones de encima. Del lado derecho hay dos términos, así que se distribuye — cada uno se multiplica por separado:

$$\frac{A}{x+3}\cdot(x+3)(x-2) + \frac{B}{x-2}\cdot(x+3)(x-2)$$

En el término de $A$, el $(x+3)$ del denominador se cancela con el $(x+3)$ que multiplicaste, quedando el $(x-2)$ colgando (sin nada con qué cancelarse). En el término de $B$ pasa lo simétrico: se cancela el $(x-2)$, queda el $(x+3)$ colgando. Del lado izquierdo, se cancela el $(x+3)(x-2)$ completo (coincide exacto con el denominador original), quedando solo $x+8$:

$$x+8 = A(x-2)+B(x+3)$$

**Paso 4 — Encontrar A y B con valores convenientes de x.** Como la igualdad vale para todo $x$, elegís valores que anulen uno de los dos términos (las raíces del denominador, una por una):

- Con $x=2$ (anula el término de $A$): $2+8=A(0)+B(5) \to 10=5B \to B=2$
- Con $x=-3$ (anula el término de $B$): $-3+8=A(-5)+B(0) \to 5=-5A \to A=-1$

**Paso 5 — Reescribir la integral ya descompuesta:**

$$\int\frac{x+8}{(x+3)(x-2)}\,dx = \int\left(\frac{-1}{x+3}+\frac{2}{x-2}\right)dx$$

**Paso 6 — Integrar cada término** (ahora son inmediatas, tipo $\int\frac{1}{x-a}dx=\ln|x-a|$, la misma regla del logaritmo de siempre):

$$= -\ln|x+3|+2\ln|x-2|+C$$

**Chequeo rápido de A y B:** verificá que $A+B$ coincida con el coeficiente de $x$ en el numerador original, y que $-2A+(-3)(-1)B$... más simple: reemplazá cualquier otro valor de $x$ (que no sea una raíz) en la ecuación del Paso 3 y confirmá que da lo mismo de los dos lados.

---

## Área entre f(x) y eje x

**Idea:** el área siempre se calcula como $\int(\text{techo}-\text{piso})dx$ — acá el eje $x$ (la recta $y=0$) hace de una de las dos "funciones", así que se aplica la misma lógica de techo/piso que en área entre dos curvas.

1. Cortes $f(x)=0$ dentro del intervalo → parten el intervalo en sub-intervalos (porque ahí puede cambiar si $f$ está arriba o abajo del eje)
2. En cada sub-intervalo, VP y signo de $f$:
   - $f>0$ (arriba del eje): techo=$f$, piso=$0$ → $\int (f-0)$
   - $f<0$ (abajo del eje): techo=$0$, piso=$f$ → $\int (0-f)$
3. Sumar las integrales de todos los sub-intervalos. El resultado final siempre debe dar positivo (es un área) — si da negativo, revisar que no se haya invertido techo y piso en algún tramo.

---

## Área entre f y g

**Idea:** el área entre dos curvas es, en cada franja vertical infinitesimal, la altura entre la curva de arriba y la de abajo — por eso se integra siempre "techo menos piso", nunca al revés (daría área negativa).

1. Igualar f=g, resolver → los cortes son los límites de integración, o los puntos que parten el intervalo si hay varios (porque ahí puede cambiar cuál de las dos es techo)
2. En cada sub-intervalo, VP y ver cuál función da mayor (esa es el techo)
3. $\int[\text{techo}-\text{piso}]dx$ — conviene resolver la resta de funciones **antes** de integrar (queda una sola expresión, más corto que integrar dos por separado y restar al final)
4. Sumar los resultados de todos los sub-intervalos

**Ecuaciones al igualar f=g** (repaso rápido de qué hacer según la forma que quede):
- $ax^2+c=0$ (sin término lineal, $b=0$) → despejar $x^2$ directo y sacar raíz (da $\pm$), sin necesidad de resolvente
- $ax^2+bx+c=0$ completa (los tres términos) → resolvente
- $x^n=k$, $n$ par → dos soluciones reales ($\pm\sqrt[n]{k}$), porque una potencia par "borra" el signo
- $x^n=k$, $n$ impar → una sola solución real, porque una potencia impar preserva el signo
- Si la ecuación factoriza → factor común + propiedad del producto nulo (un producto da 0 solo si algún factor es 0)

---

## Errores recurrentes

- $[a,b]$ = intervalo, no dos puntos
- Distribuir signo/coeficiente en TODOS los términos del paréntesis
- No cancelar factor que es parte de una suma/resta sin resolverla antes
- $du$ siempre lleva $dx$
- Simplificar raíces: buscar mayor cuadrado perfecto que divida
- Calculadora en RAD para trigonométricas
- $\sqrt{x}=x^{1/2}$ (positivo), no confundir con $x^{-1/2}$
- Punto crítico no es extremo garantizado sin verificar cambio de signo
- Continua no implica derivable
