require 'rspec'
require 'evernote_util'

describe EvernoteUtil do
  describe '#create_note_store_client' do
    subject(:client) { EvernoteUtil.create_note_store_client }
    it { should be_an Evernote::EDAM::NoteStore::NoteStore::Client }

    describe "transport url" do
      describe "iprot" do
        subject(:iprot) { client.instance_variable_get("@iprot") }
        it { iprot.trans.instance_variable_get("@url").to_s.should eql "https://sandbox.evernote.com/shard/s1/notestore" }
      end
      describe "oprot" do
        subject(:oprot) { client.instance_variable_get("@oprot") }
        it { oprot.trans.instance_variable_get("@url").to_s.should eql "https://sandbox.evernote.com/shard/s1/notestore" }
      end
    end
  end


  describe '#create_user_store_client' do
    subject(:client) { EvernoteUtil.create_user_store_client }
    it { should be_an Evernote::EDAM::UserStore::UserStore::Client}
    describe "transport url" do
      describe "iprot" do
        subject(:iprot) { client.instance_variable_get("@iprot") }
        it { iprot.trans.instance_variable_get("@url").to_s.should eql "https://sandbox.evernote.com/edam/user" }
      end
      describe "oprot" do
        subject(:oprot) { client.instance_variable_get("@oprot") }
        it { oprot.trans.instance_variable_get("@url").to_s.should eql "https://sandbox.evernote.com/edam/user" }
      end    end
  end
end