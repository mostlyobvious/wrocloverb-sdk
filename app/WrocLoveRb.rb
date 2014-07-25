class Speaker
  attr_accessor :name, :bio, :photo_url
end

class WrocLoveRb

  def speakers(callback)
    endpoint = 'http://wrocloverb.com/api/all.json'
    AFMotion::JSON.get(endpoint) do |result|
      speakers = result.object['speakers'].map do |s|
        Speaker.new(
          s['name'],
          s['bio'],
          s['photo_url']
        )
      end
      callback.(speakers)
    end
  end

end
