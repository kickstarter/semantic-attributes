# A special case of enumeration where the values are actually aliased for humans.
# Create this like a normal enumeration, but make :options a Hash of {value => alias}
#
# ==Example
#   field_is_aliased :options => {'a' => 'Alpha', 'b' => 'Beta'}
class Predicates::Aliased < Predicates::Enumerated
  def to_human(v)
    options[v]
  end

  def validate(value, record)
    self.options.has_value? value
  end

  def normalize(v)
    if RUBY_VERSION < "1.9"
      options.index(v)
    else
      options.key(v)
    end
  end
end
