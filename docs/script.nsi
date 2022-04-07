;Utilizamos Modern UI
!include "MUI2.nsh"

;Estructura general
Name "Ejemplo de creación de instalador" ;Título del instalador
OutFile "Ejemplo.exe" ;Fichero que vamos a generar y utilizar como instalador

Unicode True
InstallDir "$PROGRAMFILES\ejemplo" ;Carpeta donde se instalará la aplicación por defecto
InstallDirRegKey HKCU "Software\ejemplo" "" ; Definimos la clave en el registro
RequestExecutionLevel user ;Privilegios para el instalador. Admite valores user o admin

!define MUI_ABORTWARNINGS

;Definimos las páginas o ventanas
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

;Definimos el idioma del instalador
!insertmacro MUI_LANGUAGE "Spanish"

;Definimos el componente que se va a poder señalar para instalar
Section "Fichero jar" SecDummy
	SetOutPath "$INSTDIR"
	File Tarea_U07.jar
	SetOutPath $INSTDIR\lib ; Creamos la carpeta lib en el directorio donde se va a instalar la aplicación
	File lib\swing-layout-1.0.4.jar ;Copiamos contenido
	;Store Instalation folder
	WriteRegStr HKCU "Software\ejemplo" "" $INSTDIR
	;Creamos el desinstalador
	WriteUninstaller "$INSTDIR\Uninstall.exe" ; Definimos la opción de desinstalar
SectionEnd

;Descripciones que apareceran junto al componente cuando seleccione.
;Aparece junto al componente

;Language strings
LangString DESC_SecDummy $(LANG_SPANISH) "Instalación del fichero Tarea_U07.jar"
!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT $(SecDummy) $(DESC_SecDummy)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

;Definimos la sección para desinstalar.
Section "Desinstalar"
	Delete "$INSTDIR\Uninstall.exe"
	RMDIR "$INSTDIR"
	DeleteRegKey /ifempty HKCU "Software\ejemplo"
SectionEnd
