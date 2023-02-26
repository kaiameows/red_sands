# typed: false
# frozen_string_literal: true

RSpec.describe RedSands::Rules::RuleFactory do
  let(:dsl) do
    -> (_) {
      single_argument_attribute gems: 6
      multi_argument_attribute :resources, 3, 2
      boolean_attribute
      proc_attribute do
        meow
      end
      normal_and_proc_argument_attribute :effect do
        meow
      end
    }
  end

  before { subject.instance_eval(&dsl) }

  it 'interprets single-value attributes' do
    expect(subject.attributes[:single_argument_attribute]).to eq(gems: 6)
  end

  it 'packs multiple arguments into an array' do
    expect(subject.attributes[:multi_argument_attribute]).to eq([:resources, 3, 2])
  end

  it 'interprets boolean attributes' do
    expect(subject.attributes[:boolean_attribute]).to be true
  end

  it 'saves procs as blocks' do
    expect(subject.attributes[:proc_attribute]).to be_a(Proc)
  end

  context 'when both a proc and a normal argument are given' do
    let(:attribute_value) { subject.attributes[:normal_and_proc_argument_attribute] }
    it 'saves the proc and other arguments as an array' do
      expect(attribute_value).to include(:effect, a_kind_of(Proc))
    end
  end
end
