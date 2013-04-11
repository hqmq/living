class Sse < ActiveRecord::Base
  def data=(val)
    unless val.is_a?(String)
      val = val.to_json
    end
    super(val)
  end

  def to_sse_string
    "id: #{id}\nevent: #{event}\ndata: #{data}\n\n"
  end
end
