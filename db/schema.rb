# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150716153120) do

  create_table "autors", force: :cascade do |t|
    t.string   "nome_autor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "editoras", force: :cascade do |t|
    t.string   "nome_editora"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "instituicaos", force: :cascade do |t|
    t.string   "nome_local",        limit: 80
    t.string   "endereco_local",    limit: 100
    t.string   "responsavel_local", limit: 80
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "livros", force: :cascade do |t|
    t.string   "titulo"
    t.string   "ano"
    t.integer  "autor_id"
    t.integer  "editora_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "livros", ["autor_id"], name: "index_livros_on_autor_id"
  add_index "livros", ["editora_id"], name: "index_livros_on_editora_id"

  create_table "locacaos", force: :cascade do |t|
    t.integer  "livro_id"
    t.integer  "pessoa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "locacaos", ["livro_id"], name: "index_locacaos_on_livro_id"
  add_index "locacaos", ["pessoa_id"], name: "index_locacaos_on_pessoa_id"

  create_table "pessoas", force: :cascade do |t|
    t.string   "nome"
    t.string   "matricula"
    t.string   "cpf"
    t.string   "login"
    t.string   "senha"
    t.string   "status"
    t.integer  "instituicao_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pessoas", ["instituicao_id"], name: "index_pessoas_on_instituicao_id"

end
