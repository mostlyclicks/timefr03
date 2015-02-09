# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
Refinery::Pages::Engine.load_seed

# Added by Refinery CMS Pedals extension
Refinery::Pedals::Engine.load_seed

@pedals = [
  {name: 'Xpresso 15', riding_type: 'Road', category: 'Xpresso', weight: 66.5, description: 'Hollow titanium axle, CERAMIC SPEED bearings, carbon body, aluminum plate'},
  {name: 'Xpresso 12', riding_type: 'Road', category: 'Xpresso', weight: 77, description: 'Titanium axle, carbon body, Aluminum plate'},
  {name: 'Xpresso 10', riding_type: 'Road', category: 'Xpresso', weight: 95, description: 'Hollow steel axle, carbon body, aluminum plate'},
  {name: 'Xpresso 8', riding_type: 'Road', category: 'Xpresso', weight: 100, description: 'Hollow steel axle, composite body, aluminum plate'},
  {name: 'Xpresso 6', riding_type: 'Road', category: 'Xpresso', weight: 102, description: 'Hollow steel axle, composite body, stainless steel plate'},
  {name: 'Xpresso 4', riding_type: 'Road', category: 'Xpresso', weight: 112, description: 'Steel axle, composite body, stainless steel plate'},
  {name: 'Xpresso 2', riding_type: 'Road', category: 'Xpresso', weight: 112, description: 'Steel axle, composite body'},

  {name: 'RXS Carbon', riding_type: 'Road', category: 'RXS', weight: 117, description: 'Hollow steel axle, carbon body, angular adjustment'},
  {name: 'RXS Speed', riding_type: 'Road', category: 'RXS', weight: 130, description: 'Steel axle, composite body, angular adjustment'},
  {name: 'RXS First', riding_type: 'Road', category: 'RXS', weight: 130, description: 'Steel axle, composite body'},

  {name: 'ATAC XC 12', riding_type: 'MTB', category: 'XC', weight: 124, description: 'Titanium axle, carbon body, stainless stell molded dual-arches, angular adjustment'},
  {name: 'ATAC XC 8', riding_type: 'MTB', category: 'XC', weight: 143, description: 'Hollow steel axle, carbon body, stainless steel molded dual-arches, angular adjustment'},
  {name: 'ATAC XC 6 White', riding_type: 'MTB', category: 'XC', weight: 145, description: 'Hollow steel axle, composite body, stainless steel stamped dual-arches, angular adjustment'},
  {name: 'ATAC XC 6 Plasma', riding_type: 'MTB', category: 'XC', weight: 145, description: 'Hollow steel axle, composite body, stainless steel stamped dual-arches, angular adjustment'},
  {name: 'ATAC XC 4', riding_type: 'MTB', category: 'XC', weight: 147, description: 'Hollow steel axle, composite body, stainless steel stamped dual-arches'},
  {name: 'ATAC XC 2', riding_type: 'MTB', category: 'XC', weight: 151, description: 'Steel axle, composite body, stainless steel stamped dual-arches'},

  {name: 'ATAC MX 12', riding_type: 'MTB', category: 'MX', weight: 158, description: 'Oversized titanium axle, carbon body, stainless steel molded dual-arches, hollow spring axle'},
  {name: 'ATAC MX 8', riding_type: 'MTB', category: 'MX', weight: 182, description: 'Oversized hollow steel axle, carbon body, hollow spring axle'},
  {name: 'ATAC MX 6 White', riding_type: 'MTB', category: 'MX', weight: 190, description: 'Oversized hollow steel axle, composite body, hollow spring axle'},
  {name: 'ATAC MX 6 Plasma', riding_type: 'MTB', category: 'MX', weight: 190, description: 'Oversized hollow steel axle, composite body, hollow spring axle'},
  {name: 'ATAC MX 4', riding_type: 'MTB', category: 'MX', weight: 192, description: 'Hollow steel axle, composite body'},
  {name: 'ATAC MX 2', riding_type: 'MTB', category: 'MX', weight: 197, description: 'Steel axle, composite body'},

  {name: 'ATAC DH 2', riding_type: 'MTB', category: 'DH', weight: 258, description: ''}
]


@pedals.each do |p|
  Refinery::Pedals::Pedal.create(
    name: p[:name],
    riding_type: p[:riding_type],
    category: p[:category],
    weight: p[:weight],
    description: p[:description]
  )
end