# Create a manager
manager = Manager.find_or_create_by!(email: "manager@venuehub.com") do |m|
  m.password = "password123"
  m.password_confirmation = "password123"
  m.name = "Ali Manager"
end

puts "Manager created: #{manager.email}"

# Create spaces (venues)
spaces = [
  {
    name: "Skyline Rooftop",
    per_hour: 120,
    location: "Downtown",
    capacity: 80,
    area: 2500,
    description: "A modern rooftop venue with city skyline views.",
    slug: "skyline-rooftop"
  },
  {
    name: "The Brick Loft",
    per_hour: 90,
    location: "Brooklyn",
    capacity: 60,
    area: 1800,
    description: "Industrial-style loft with exposed brick walls.",
    slug: "the-brick-loft"
  },
  {
    name: "Garden Pavilion",
    per_hour: 150,
    location: "Queens",
    capacity: 120,
    area: 3200,
    description: "Open-air garden space perfect for weddings and parties.",
    slug: "garden-pavilion"
  },
  {
    name: "Creative Studio",
    per_hour: 70,
    location: "SoHo",
    capacity: 40,
    area: 1200,
    description: "Minimal studio space for photoshoots and workshops.",
    slug: "creative-studio"
  },
  {
    name: "Conference Hub",
    per_hour: 110,
    location: "Midtown",
    capacity: 100,
    area: 2800,
    description: "Fully equipped venue for corporate meetings and events.",
    slug: "conference-hub"
  },
  {
    name: "Vintage Hall",
    per_hour: 130,
    location: "Harlem",
    capacity: 150,
    area: 3500,
    description: "Classic hall with vintage interiors and high ceilings.",
    slug: "vintage-hall"
  }
]

spaces.each do |space|
  manager.spaces.find_or_create_by!(slug: space[:slug]) do |s|
    s.name = space[:name]
    s.per_hour = space[:per_hour]
    s.location = space[:location]
    s.capacity = space[:capacity]
    s.area = space[:area]
    s.description = space[:description]
  end
end

puts "6 venues created successfully"
