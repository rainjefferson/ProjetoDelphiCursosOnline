object dmDados: TdmDados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 317
  Width = 472
  object ConexaoDados: TFDConnection
    Params.Strings = (
      'Database=AcademiaPregadores'
      'User_Name=SA'
      'Password=r41n'
      'Server=localhost\MSSQLSERVER2017'
      'DriverID=MSSQL')
    LoginPrompt = False
    BeforeConnect = ConexaoDadosBeforeConnect
    Left = 72
    Top = 32
  end
  object FDPhysMSSQLDriverLink1: TFDPhysMSSQLDriverLink
    Left = 192
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'FMX'
    Left = 320
    Top = 32
  end
  object QryTmp: TFDQuery
    Connection = ConexaoDados
    Left = 72
    Top = 96
  end
  object QryTrilhasHome: TFDQuery
    Connection = ConexaoDados
    SQL.Strings = (
      'SELECT '
      '   T.TRI_ID, '
      '   TC.TRC_ORDEM_POSICAO,'
      '   T.TRI_NOME,'
      '   C.CUR_NOME,'
      '   C.CUR_ID,'
      '   C.CUR_IMG_CAPA,'
      '   C.CUR_ID_VIDEO_VIMEO_CHAMADA,'
      '   C.CUR_IMG_CHAMADA,   '
      ''
      '   (SELECT COUNT(*) '
      '    FROM '
      '      AULAS_MODULOS A '
      '      INNER JOIN MODULOS M ON (A.MOD_ID = M.MOD_ID)'
      '    WHERE '
      '      M.CUR_ID = C.CUR_ID AND'
      #9'  A.FG_EXCLUIDO = 0 AND'
      
        #9'  ((A.AUL_EM_CRIACAO <> 1) OR (A.AUL_EM_CRIACAO IS NULL))  ) AS' +
        ' TOT_AULAS,'
      ''
      '  ISNULL((SELECT SUM(((ISNULL(DURACAO,0)/60)/60)) '
      '   FROM VIDEOS_VIMEO'
      '   WHERE ID_VIDEO IN ('
      '   SELECT A.AUL_ID_VIDEO_VIMEO'
      '   FROM '
      '     AULAS_MODULOS A '
      '     INNER JOIN MODULOS M ON (A.MOD_ID = M.MOD_ID)'
      '   WHERE '
      '     M.CUR_ID = C.CUR_ID AND'
      '     A.FG_EXCLUIDO = 0 AND'
      '     A.AUL_ID_VIDEO_VIMEO IS NOT NULL AND'
      
        '     ((A.AUL_EM_CRIACAO <> 1) OR (A.AUL_EM_CRIACAO IS NULL)))),0' +
        ') AS TOT_HORAS_CURSO'
      ''
      'FROM'
      '   TRILHAS_FIXAS F '
      '   INNER JOIN TRILHAS T ON (F.TRI_ID = T.TRI_ID)'
      '   INNER JOIN TRILHAS_CURSOS TC ON (T.TRI_ID = TC.TRI_ID)'
      '   INNER JOIN CURSOS C ON (TC.CUR_ID = C.CUR_ID)'
      'WHERE'
      '   F.FG_EXCLUIDO = 0 AND'
      '   T.FG_EXCLUIDO = 0 AND '
      '   C.FG_EXCLUIDO = 0 AND   '
      '   C.CUR_ATIVO = 1 AND'
      '   T.TRI_ATIVO = 1 AND'
      
        '   ((C.CUR_DISPONIVEL_ATE > GETDATE()) OR (C.CUR_DISPONIVEL_ATE ' +
        'IS NULL)) AND'
      
        '   ((C.CUR_PUBLICADO_EM <= GETDATE()) OR (C.CUR_PUBLICADO_EM IS ' +
        'NULL)) AND'
      '   ((C.CUR_NAO_LISTADO <> 1) OR (C.CUR_NAO_LISTADO IS NULL)) AND'
      '   ((C.CUR_EM_CRIACAO <> 1) OR (C.CUR_EM_CRIACAO IS NULL))   '
      ''
      'ORDER BY F.TRF_ORDEM_POSICAO, TC.TRC_ORDEM_POSICAO;')
    Left = 72
    Top = 160
  end
  object QryCursosAlunoPlayer: TFDQuery
    Connection = ConexaoDados
    SQL.Strings = (
      'SELECT   '
      '   C.CUR_ID,'
      '   C.CUR_NOME,'
      '   C.CUR_IMG_MINIATURA, '
      '   M.MOD_ID,'
      '   M.MOD_NOME,'
      '   L.AUL_ID,'
      '   L.AUL_NOME   '
      'FROM'
      '   CURSOS_ALUNOS A  '
      '   INNER JOIN CURSOS C ON (C.CUR_ID = A.CUR_ID)'
      '   INNER JOIN MODULOS M ON (M.CUR_ID = C.CUR_ID)'
      '   INNER JOIN AULAS_MODULOS L ON (L.MOD_ID = M.MOD_ID)'
      'WHERE'
      '   C.FG_EXCLUIDO = 0 AND   '
      '   C.CUR_ATIVO = 1  AND   '
      '   M.FG_EXCLUIDO = 0 AND'
      '   L.FG_EXCLUIDO = 0 AND'
      '   A.ALU_ID = :ALU_ID'
      'ORDER BY C.CUR_ID, M.MOD_ID, L.AUL_ID;')
    Left = 72
    Top = 224
    ParamData = <
      item
        Name = 'ALU_ID'
        ParamType = ptInput
      end>
  end
end
