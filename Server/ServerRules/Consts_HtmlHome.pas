unit Consts_HtmlHome;

interface

const
  _CLASSE_SECTION_DESTAQUE = 'section-featured';
  _CLASSE_SECTION_NORMAL = 'section second-section';
  _CLASSE_SECTION_ULTIMA = 'section last-section';

  _COR_TITULO_TRILHA_TOPO = 'section-title';
  //_COR_TITULO_TRILHA_NORMAL = 'section-title-normal';

  _TRILHAS_SECAO_NORMAL_INICIO = '<section class=":CLASSE_SECTION"> ' +
                                 ' <div class="container-fluid"> ' +
                                 '     <div class="section-content"> ' +
                                 '         <h2 class=":CLASS_COLOR_H2">:TRI_NOME</h2> ';

  _FAIXA_TRILHA_INICIO = '         <div id="featured" class="slider-container">';

  _CAPA_TRILHA =
                '<div class="course-cover"> ' +
                '    <img src="files/:CUR_IMG_CAPA" alt=""> ' +
                '    <div class="course-info"> ' +
                '        <button class="btn-watch-now"> ' +
                '            <img src="img/watch-now-btn.png" alt="Assista agora"> ' +
                '        </button> ' +
                '        <div class="course-data"> ' +
                '            <button class="add-to-my-courses"> ' +
                '                <img src="img/add-to-my.png" alt="Meus cursos"> Meus cursos ' +
                '            </button> ' +
                '            <div class="course-hours"> ' +
                '                <img src="img/hours.png" alt="Horas"> :TOT_HORAS_CURSOh/Aula ' +
                '            </div> ' +
                '            <div class="course-classes"> ' +
                '                <img src="img/classes.png" alt="Aulas"> :QUANT_AULAS :NOME_AULAS ' +
                '            </div> ' +
                '        </div> ' +
                '        <button class="btn-see-more" onclick="showPreview({el: this, collapseId: '':ID_BANNER_CURSO'', video: `https:/player.vimeo.com/video/:ID_VIDEO_VIMEO?title=0&byline=0&portrait=0`})"> ' +
                '        </button> ' +
                '    </div> ' +
                '</div> ';

  _FAIXA_TRILHA_FIM = ' </div> ';


  _BANNER_DETALHAMENTO_VIDEO =
          ' <div class="course-collapse" id=":ID_BANNER_CURSO"> ' +
          '      <button class="btn-close-collapse" onclick="closeCollapse(this)"><img src="img/close.png" alt="Fechar"></button> ' +
          '      <div class="collapse-info"> ' +
          '          <button class="btn-collapse-info"> ' +
          '              <img src="img/heart.png" class="collapse-info-icon" alt=""> ' +
          '              <img src="img/heart-active.png" class="collapse-info-icon active" alt=""> QUERO FAZER ESTE CURSO ' +
          '          </button> ' +
          '          <button class="btn-collapse-info"> ' +
          '              <img src="img/clock.png" class="collapse-info-icon" alt=""> ' +
          '              <img src="img/clock-active.png" class="collapse-info-icon active" alt=""> 45 MINUTOS ' +
          '          </button> ' +
          '          <button class="btn-collapse-info"> ' +
          '              <img src="img/pc.png" class="collapse-info-icon" alt=""> ' +
          '              <img src="img/pc-active.png" class="collapse-info-icon active" alt=""> 8 EPISÓDIOS ' +
          '          </button> ' +
          '      </div> ' +
          '      <img src="files/:CUR_IMG_CHAMADA" class="course-collapse-image"> ' +
          ' </div> ';


  _TRILHAS_SECAO_DESTAQUES_FIM = '    </div> ' +
                                 '  </div> ' +
                                 '</section>';

  _BOTAO_NOTIFICACOES_USUARIO =
    '<button class="btn-notifications"> ' +
    '    <span class="notifications-badge">9</span>' +
    '    <img src="img/notification-icon.png" alt="Meu perfil">' +
    '</button>';

  _BOTAO_ASSINE_AGORA_TOPO =
    '<button class="btn-assine" data-toggle="modal" data-target="#loginModal"> '+
    '    <img src="img/btn-assine.png" alt="Assine Agora!"> ' +
    '</button>';

 /// <summary>
 ///   Area do Player do Aluno
 /// </summary>

  _PAINEL_CURSO_MODULOS_AULAS =
    '<aside class="col-md-3 player-sidebar" id="sidebar-el">' +
    '     <div class="sidebar-header">' +
    '       <h4>:CUR_NOME</h4>' +
    '       <h4>:TOT_AULAS_CUR AULAS</h4>' +
    '       <h4>0 CONCLUÍDAS</h4>' +
    '     </div>' +
    '     <div class="rate-container">' +
    '       <p>Classifique:</p>' +
    '       <div class="rate">' +
    '         <input type="radio" id="star5" name="rate" value="5" />' +
    '         <label for="star5" title="text">5 stars</label>' +
    '         <input type="radio" id="star4" name="rate" value="4" />' +
    '         <label for="star4" title="text">4 stars</label>' +
    '         <input type="radio" id="star3" name="rate" value="3" />' +
    '         <label for="star3" title="text">3 stars</label>' +
    '         <input type="radio" id="star2" name="rate" value="2" />' +
    '         <label for="star2" title="text">2 stars</label>' +
    '         <input type="radio" id="star1" name="rate" value="1" />' +
    '         <label for="star1" title="text">1 star</label>' +
    '       </div>' +
    '     </div>' +
    '     <div class="progress-container">' +
    '       <button class="btn-close-sidebar" id="toggle-sidebar-btn" onclick="toggleSidebar()">' +
    '         <img src="img/close-sidebar.png" alt="Fechar">' +
    '       </button>' +
    '       <div class="col">' +
    '         <h4>Progresso 25%</h4>' +
    '         <div class="progress">' +
    '           <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>' +
    '         </div>' +
    '       </div>' +
    '     </div>' +
    '     <div class="sidebar-content-container">' +
    '' +
    '    :PAINEL_DIREITO_MODULOS    ' +
    '' +
    '       <a href="#" class="btn-outline-white"><i class="fa fa-file-contract"></i> Emitir meu certificado</a>' +
    '     </div>' +
    '   </aside>';

  _PLAYER_PAINEL_DIREITO_MODULO =
    '       <!-- Modulo 1 -->' +
    '       <div>' +
    '         <div class="content-module-row">' +
    '           <div class="module-title">:MOD_NOME</div>' +
    '           <div class="module-info">' +
    '             <!--<span>Módulo</span>-->' +
    '             <span>:TOT_AULAS_MOD Aulas</span>' +
    '           </div>' +
    '           <div>' +
    '             <button class="btn-less-more" type="button" data-toggle="collapse" data-target="#m_:MOD_ID" aria-expanded="false" aria-controls="m_:MOD_ID">' +
    '               <span class="line-1"></span>' +
    '               <span class="line-2"></span>' +
    '             </button>' +
    '           </div>' +
    '         </div>' +
    '         <div class="collapse" id="m_:MOD_ID">' +

    '' +
    '    :PAINEL_DIREITO_AULAS_MODULO    ' +
    '' +
    '' +
    '         </div>' +
    '       </div>' +
    '       <!-- Fim da modulo 1 -->';


  _PLAYER_PAINEL_DIREITO_AULA_MODULO_VERDE =
    '           <div class="module-row row-green">' +
    '             <div class="module-class-row">' +
    '               <div class="class-video">' +
    '                 <button class="btn-class">' +
    '                   <i class="fas fa-redo"></i>' +
    '                 </button>' +
    '                 <img src="files/:CUR_IMG_MINIATURA" alt="Aula">' +
    '               </div>' +
    '               <div class="class-info">' +
    '                 <div class="class-title">:AUL_NOME</div>' +
    '                 <div class="class-info-item">' +
    '                   <i class="fa fa-trophy"></i>+ 100' +
    '                 </div>' +
    '               </div>' +
    '             </div>' +
    '             <div class="progress">' +
    '               <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>' +
    '             </div>' +
    '           </div>';

 _PLAYER_PAINEL_DIREITO_AULA_MODULO_VERMELHO =
    '           <div class="module-row row-red">' +
    '             <div class="module-class-row">' +
    '               <div class="class-video">' +
    '                 <button class="btn-class">' +
    '                   <i class="fas fa-play"></i>' +
    '                 </button>' +
    '                 <img src="files/:CUR_IMG_MINIATURA" alt="Aula">' +
    '               </div>' +
    '               <div class="class-info">' +
    '                 <div class="class-title">:AUL_NOME</div>' +
    '                 <div class="class-info-item">' +
    '                   <i class="fa fa-clock"></i>AGENDADO PARA 06/01/19</div>' +
    '                 <div class="class-info-item">' +
    '                   <i class="fa fa-key"></i>Liberar agora por R$ 0,50</div>' +
    '               </div>' +
    '             </div>' +
    '             <div class="progress">' +
    '               <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>' +
    '             </div>' +
    '           </div>';

 _PLAYER_PAINEL_DIREITO_AULA_MODULO_AMARELO =
    '           <div class="module-row row-yellow">' +
    '             <div class="module-class-row">' +
    '               <div class="class-video">' +
    '                 <button class="btn-class">' +
    '                   <i class="fas fa-play"></i>' +
    '                 </button>' +
    '                 <img src="files/:CUR_IMG_MINIATURA alt="Aula">' +
    '               </div>' +
    '               <div class="class-info">' +
    '                 <div class="class-title">:AUL_NOME</div>' +
    '                 <button class="btn-class-info">' +
    '                   <i class="fa fa-arrow-alt-circle-right"></i>Continuar assistindo' +
    '                 </button>' +
    '               </div>' +
    '             </div>' +
    '             <div class="progress">' +
    '               <div class="progress-bar" role="progressbar" style="width: 25%;" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>' +
    '             </div>' +
    '           </div>';

implementation

end.
