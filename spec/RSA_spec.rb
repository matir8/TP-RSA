require 'RSA'

RSpec.describe RSA do 
  describe 'test class getters' do
    a = RSA.new(1, 2, 3)

    it 'should get n' do
      expect(a.n).to eq 1
    end

    it 'should get e' do
      expect(a.e).to eq 2
    end

    it 'should get d' do
      expect(a.d).to eq 3
    end
  end

  describe 'test new_key' do
    key = RSA.new_key
    
    it 'should return int array with three values' do
      expect(key.length).to eq 3
      expect(key).to all be_an(Integer)
    end

  end

  describe 'encrypt and decrypt' do
    it 'encrypt should return string' do
      a = RSA.new(1, 2, 3)
      expect(a.encrypt("Hello")).to be_a(String)
    end

    it 'decrypt should return string' do
      a = RSA.new(1, 2, 3)
      encrypted = a.encrypt("Hello")
      expect(a.decrypt(encrypted)).to be_a(String)
    end

    it 'should encrypt and decrypt succeful' do
      str = 'Test message'
      n, e, d = RSA.new_key
      a = RSA.new(n, e, d)
      encrypted = a.encrypt(str)
      expect(str).to eq a.decrypt(encrypted)
    end
  end
end