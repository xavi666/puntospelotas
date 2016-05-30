class ImportsController < ApplicationController

  require 'nokogiri'
  require 'open-uri'

  def index
  end

  def statistics
    @partits = []
    html_pages = HtmlPage.all

    html_pages.each do |html_page| 
      pagina_partit = Nokogiri::XML(html_page.html)

      # dades equips
      taula_equips = pagina_partit.css("div.titulopartidonew")[0]
      row_equips = taula_equips.search('tr')
      @equips = row_equips.collect do |row|
        detail = {}
        [
          [:local, 'td[1]/text()'],
          [:visitant, 'td[2]/text()']
        ].each do |name, xpath|
          equip = row.at_xpath(xpath).to_s.strip
          equip.to_s.slice!("&#xA0;") if name == :visitant
          equip = equip[0..-3] if name == :local

          detail[name] = equip
        end
        if detail[:local] != ''
          detail
        end
      end

      @equips.delete_if { |k, v| k.nil? }
      @partits.push(@equips)

      # dades jugadors
      taula_jugadors = pagina_partit.css("table.estadisticasnew")[1]
      rows_jugadors = taula_jugadors.search('//tr')
      local_visitant = "local"
      temporada = Setting.find_by_name("season_data").value
      equips_jornada = 9

      jornada = (html_page.game_number / equips_jornada).round + 1

      @statistics = rows_jugadors.collect do |row|
        detail = {}
        [
          [:number, 'td[1]/text()'],
          [:name, 'td[2]/a/text()'],
          [:seconds, 'td[3]/text()'],
          [:points, 'td[4]/text()'],
          [:two_p, 'td[5]/text()'],
          [:two_pm, 'td[6]/text()'],
          [:three_p, 'td[7]/text()'],
          [:three_pm, 'td[8]/text()'],
          [:one_p, 'td[9]/text()'],
          [:one_pm, 'td[10]/text()'],
          [:rebounds, 'td[11]/text()'],
          [:dorebounds, 'td[12]/text()'],
          [:assists, 'td[13]/text()'],
          [:steals, 'td[14]/text()'],
          [:turnovers, 'td[15]/text()'],
          [:fastbreaks, 'td[16]/text()'],
          [:mblocks, 'td[17]/text()'],
          [:rblocks, 'td[18]/text()'],
          [:slunks, 'td[19]/text()'],
          [:mfaults, 'td[20]/text()'],
          [:rfaults, 'td[21]/text()'],
          [:positive_negative, 'td[22]/text()'],
          [:value, 'td[23]/text()'],
          [:team, local_visitant],
          [:game_number, jornada],
          [:season, temporada]
        ].each do |name, xpath|
          if name == :team || name == :game_number || name == :season
            detail[name] = xpath
          else
            detail[name] = row.at_xpath(xpath).to_s.strip || 0
          end
        end
        local_visitant = "visitant" if detail[:number] == "E"
        if is_number?(detail[:number])
          detail
        end
      end
      @statistics.delete_if { |k, v| k.nil? }

      #ap @statistics

      create_from_list @statistics, @equips
    end
  end

  private

   
end