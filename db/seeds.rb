# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
MusicItem.destroy_all

temp_password = "123"

User.create([
  { email: "steve@apple.com",
    password: temp_password,
    password_confirmation: temp_password
  },
  { email: "ben@jerrys.com",
    password: temp_password,
    password_confirmation: temp_password
  },
  { email: "lau@gmail.com",
    password: temp_password,
    password_confirmation: temp_password
  }
])

MusicItem.create([
  { href: "Let It Go",
    mood: "happy"
  },
  { href: "Call Me Maybe",
    mood: "happy"
  },
  { href: "Never Gonna Give You Up",
    mood: "sad"
  },
  { href: "To Zanarkand",
    mood: "sad"
  },
  { href: "Star Wars Gangsta Rap",
    mood: "angry"
  },
  { href: "Testify",
    mood: "angry"
  },
  { href: "Let It Go",
    mood: "motivational"
  },
  { href: "Gangnam Style",
    mood: "motivational"
  }
])