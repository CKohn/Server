
local cfg = {}

-- PCs positions
cfg.pcs = {
  {442.04299926758, -977.76538085938, 30.689607620239}
}

-- vehicle tracking configuration
cfg.trackveh = {
  min_time = 300, -- min time in seconds
  max_time = 600, -- max time in seconds
  service = "police" -- service to alert when the tracking is successful
}

-- wanted display
cfg.wanted = {
  blipid = 458,
  blipcolor = 38,
  service = "police"
}

-- illegal items (seize)
cfg.seizable_items = {
  "dirty_money",
  "cannabis",
  "cacaina",
  "folhadecoca",
  "weed"
}

-- jails {x,y,z,radius}
cfg.jails = {
  {459.485870361328,-1001.61560058594,24.914867401123,2.1},
  {459.305603027344,-997.873718261719,24.914867401123,2.1},
  {459.999938964844,-994.331298828125,24.9148578643799,1.6}
}

-- fines
-- map of name -> money
cfg.fines = {
  ["Desacato."] = 5000,
  ["Fuga"] = 2500,
  ["Sem habilitação"] = 5000,  
  ["Assalto a Civil"] = 5000,
  ["Assalto a Policia."] = 10000,
  ["Porte ilegal de arma"] = 4000,
  ["Porte de drogas."] = 1500,
  ["Tráfico de drogas"] = 6000,
  ["Alta Velocidade"] = 5000,
  ["Direção Perigosa"] = 5000,
  ["Ultrapassar sinal vermelho"] = 1000,
  ["Furto/Roubo de veículos."] = 1000,
  ["Poluição Sonora"] = 1000,
  ["Assasinato."] = 10000,
  ["Tentativa de homicídio."] = 7500,
  ["Roubo a Banco."] = 10000,
  ["Roubo a Loja."] = 6000,
}

return cfg
