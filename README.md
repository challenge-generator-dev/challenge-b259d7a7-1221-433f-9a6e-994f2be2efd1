# Aprovisionamiento de infraestructura con Terraform para el servicio de notificaciones

El objetivo es aprovisionar la red y el computo del servicio de notificaciones utilizando Terraform. Se deben usar workspaces para separar los entornos de desarrollo y producción, etiquetar todos los recursos con los tags Project y Environment, y evitar el uso de provisioners local-exec.

## Informacion General

| Campo | Valor |
|-------|-------|
| **Tema** | Infraestructura como codigo con Terraform |
| **Nivel** | advanced-l2 |
| **Tipo** | practical |
| **Tiempo estimado** | 8 horas |

## Stack

- **Lenguaje:** Terraform
- **Framework:** Terraform AWS Provider
- **Version:** 1.5+

## Fases del Reto

### Fase 0: Configuración del Proyecto

**Objetivo:** Tener el proyecto base del reto funcionando en tu máquina: clonar el repositorio, instalar las herramientas y verificar que compila y arranca antes de empezar a practicar.

**Tiempo estimado:** 15-30 minutos

**Instrucciones:**

- Instala las herramientas para ejecutar el proyecto: Terraform 1.5+.
- Clona el repositorio del reto (el enlace viene en la entrega del reto y en la sección "Repositorio del Proyecto" del PDF) y ábrelo en tu IDE.
- Instala las dependencias y compila ejecutando `terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate` en la raíz del repositorio.
- Confirma que el comando termina sin errores: el proyecto arranca y sus pruebas corren.
- Ubica los archivos de práctica: son los que contienen `TODO(reto)` (búscalos en el repositorio). Lee el README.md y el AGENTS.md antes de empezar.

**Entregable:** El proyecto compila/arranca sin errores con `terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate`.

<details>
<summary>Pistas de conocimiento</summary>

- Los archivos con `TODO(reto)` son el ejercicio: el resto del repositorio ya está resuelto y no hace falta tocarlo.
- Si el comando de verificación falla, revisa la versión de las herramientas instaladas antes de modificar código.
- AGENTS.md describe el reto, el comando de verificación y las reglas del repositorio.

</details>

### Fase 1: Configuración inicial de Terraform

**Objetivo:** Configurar Terraform para trabajar con AWS y separar los entornos de desarrollo y producción.

**Tiempo estimado:** 2 horas

**Instrucciones:**

- Configurar el provider de AWS en Terraform.
- Crear workspaces para los entornos de desarrollo y producción.
- Etiquetar todos los recursos con los tags Project y Environment.

**Entregable:** Configuración de Terraform lista para ser usada en los siguientes pasos.

<details>
<summary>Pistas de conocimiento</summary>

- Recuerda que debes usar workspaces para separar los entornos.
- Etiqueta todos los recursos con los tags requeridos.

</details>

### Fase 2: Aprovisionamiento de la red

**Objetivo:** Aprovisionar la red del servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear un VPC para el servicio de notificaciones.
- Configurar las subredes públicas y privadas.
- Configurar las tablas de rutas y las puertas de enlace.
- Configurar los grupos de seguridad.

**Entregable:** Red del servicio de notificaciones aprovisionada con Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Recuerda que debes evitar el uso de provisioners local-exec.
- Etiqueta todos los recursos con los tags requeridos.

</details>

### Fase 3: Aprovisionamiento del computo

**Objetivo:** Aprovisionar el computo del servicio de notificaciones utilizando Terraform.

**Tiempo estimado:** 3 horas

**Instrucciones:**

- Crear una instancia EC2 para el servicio de notificaciones.
- Configurar el balanceador de carga.
- Configurar el auto scaling group.

**Entregable:** Computo del servicio de notificaciones aprovisionado con Terraform.

<details>
<summary>Pistas de conocimiento</summary>

- Recuerda que debes evitar el uso de provisioners local-exec.
- Etiqueta todos los recursos con los tags requeridos.

</details>

## Dimensiones Evaluadas

- **queEs**: ¿Qué es Terraform y para qué se utiliza en este reto?
- **paraQueSirve**: ¿Para qué sirve usar workspaces en Terraform en este reto?
- **comoSeUsa**: ¿Cómo se usa Terraform para aprovisionar la red y el computo del servicio de notificaciones?
- **erroresComunes**: ¿Cuáles son los errores comunes al usar Terraform para aprovisionar infraestructura?
- **queDecisionesImplica**: ¿Qué decisiones implica el uso de Terraform para aprovisionar la infraestructura del servicio de notificaciones?

## Criterios de Evaluacion

- Configuración inicial de Terraform realizada correctamente.
- Uso de workspaces para separar los entornos de desarrollo y producción.
- Etiquetado de todos los recursos con los tags Project y Environment.
- Aprovisionamiento de la red del servicio de notificaciones utilizando Terraform.
- Aprovisionamiento del computo del servicio de notificaciones utilizando Terraform.

## Como trabajar con un asistente de IA

Hay dos caminos, elegi uno:

- **AGENTS.md** (recomendado) — instrucciones nativas del repo. Abri esta carpeta con tu agente local (Claude Code, Cursor, Codex, Copilot, Gemini) y las carga solo. Sabe que archivos faltan y con que comando se verifica, y completa el scaffold escribiendo en disco.
- **PROMPT_MEJORA.md** — para copiar y pegar en un chat (claude.ai, ChatGPT) si no tenes un agente en el IDE. Declara lo mismo que AGENTS.md; los archivos que te devuelva el chat los guardas en esta carpeta respetando las rutas.

Ninguno de los dos resuelve las fases del reto: eso es tu trabajo.

## Verificacion

El proyecto esta listo para trabajar cuando este comando corre sin errores:

```bash
terraform init -backend=false && terraform -chdir=modules/compute init -backend=false && terraform -chdir=modules/network init -backend=false && terraform validate && terraform -chdir=modules/compute validate && terraform -chdir=modules/network validate
```

---

*Reto generado automaticamente por Challenge Generator - Pragma*
