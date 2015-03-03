Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  if defined?(Refinery::User)
    Refinery::User.all.each do |user|
      if user.plugins.where(:name => 'refinerycms-framesets').blank?
        user.plugins.create(:name => 'refinerycms-framesets',
                            :position => (user.plugins.maximum(:position) || -1) +1)
      end
    end
  end

  @framesets = [
    {name: 'Skylon Team AKTIV', color: 'Team', description: 'Skylon with AKTIV fork and Directlink seat mast in Team paint scheme.', locale: 'EN_en'},
    {name: 'Skylon White AKTIV', color: 'White', description: 'Skylon with AKTIV fork and Directlink seat mast in white.', locale: 'EN_en'},
    {name: 'Skylon Red AKTIV', color: 'Red', description: 'Skylon with AKTIV fork and Directlink seat mast in red.', locale: 'EN_en'},
    {name: 'Skylon Plasma AKTIV', color: 'Plasma', description: 'Skylon with AKTIV fork and Directlink seat mast in plasma.', locale: 'EN_en'},

    {name: 'Skylon Team', color: 'Team', description: 'Skylon in Team paint scheme.', locale: 'EN_en'},
    {name: 'Skylon White', color: 'White', description: 'Skylon in white.', locale: 'EN_en'},
    {name: 'Skylon Red', color: 'Red', description: 'Skylon in red.', locale: 'EN_en'},
    {name: 'Skylon Plasma', color: 'Plasma', description: 'Skylon in plasma.', locale: 'EN_en'},

    {name: 'Izon White AKTIV', color: 'White', description: 'Izon with AKTIV fork and Translink seat mast in white.', locale: 'EN_en'},
    {name: 'Izon Red AKTIV', color: 'Red', description: 'Izon with AKTIV fork and Translink seat mast in red.', locale: 'EN_en'},

    {name: 'Izon Plasma', color: 'Plasma', description: 'Izon in plasma.'},
    {name: 'Izon Red', color: 'Red', description: 'Izon in black carbon with red.'},

    {name: 'Fluidity Red AKTIV', color: 'Red', description: 'Fluidity with AKTIV fork and Translink seat mast in red.', locale: 'EN_en'},
    {name: 'Fluidity Black AKTIV', color: 'Black', description: 'Fluidity with AKTIV fork and Translink seat mast in black.', locale: 'EN_en'},
    {name: 'Fluidity Yellow AKTIV', color: 'Yellow', description: 'Fluidity with AKTIV fork and Translink seat mast in yellow.', locale: 'EN_en'},

    {name: 'Fluidity DISC Red', color: 'Red', description: 'Fluidity in red with DISC brakes.', locale: 'EN_en'},
    {name: 'Fluidity White', color: 'White', description: 'Fluidity in white.', locale: 'EN_en'}
  ]

  @framesets.each do |fs|
    Refinery::Framesets::Frameset.create(
      name: fs[:name],
      color: fs[:color],
      description: fs[:description]
    )
  end

end
