DECLARE 
@array as VARCHAR(MAX),
@separador as VARCHAR(1),
@posicion INT,
@VALUE VARCHAR(1000)

--Se crea un separador
SET @separador = ','
--Agrego las tablas a consultar
SET @array = 'TB_TokensUsuario,TB_RolesUsuarios,TB_UsuariosLocalidades,TB_UsuariosSucriptores,TB_DatosBase,TB_Usuarios,TB_TransaccionesModulosAplicacionesRolAplicaciones,TB_SesionesUsuarios,TB_CargosUsuarios,TB_HabilidadesUsuarios,TB_AutonomiasUsuarios,TB_Suplencias,TB_HistorialClave'

WHILE PATINDEX('%' + @separador + '%', @array ) <> 0 
BEGIN
   SELECT  @posicion = PATINDEX('%' + @separador + '%',@array)
   SELECT  @VALUE = LEFT(@array , @posicion - 1)
   SELECT  @array = STUFF(@array, 1, @posicion, '')
    SELECT @value as 'TABLA PRINCIPAL', S.[name] as 'Tablas que depende'
    FROM sys.objects S INNER JOIN sys.sysreferences R 
        ON S.object_id = R.fkeyid
    WHERE S.[type] = 'U' 
         AND R.rkeyid = OBJECT_ID(@VALUE)

END
