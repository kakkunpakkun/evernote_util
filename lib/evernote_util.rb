require "evernote_util/version"
require 'evernote-thrift'

module EvernoteUtil
  def self.create_note_store_client(note_store_url = "https://sandbox.evernote.com/shard/s1/notestore")
    noteStoreTransport = Thrift::HTTPClientTransport.new(note_store_url)
    noteStoreProtocol = Thrift::BinaryProtocol.new(noteStoreTransport)

    Evernote::EDAM::NoteStore::NoteStore::Client.new(noteStoreProtocol)
  end

  def self.create_user_store_client(user_store_url = "https://sandbox.evernote.com/edam/user")
    userStoreTransport = Thrift::HTTPClientTransport.new(user_store_url)
    userStoreProtocol = Thrift::BinaryProtocol.new(userStoreTransport)

    Evernote::EDAM::UserStore::UserStore::Client.new(userStoreProtocol)
  end
end
