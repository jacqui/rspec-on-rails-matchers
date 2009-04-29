remove_attributes_protected_from_mass_assignment

Spec::Matchers.create :allow_mass_assignment_of do |attribute|
  match do |model|
    model.send(:remove_attributes_protected_from_mass_assignment, {attribute => 'value'}).should == {attribute => 'value'}
  end
  
  failure_message_for_should do |model|
    "#{model} was expected to allow #{attribute} to be mass-assigned"
  end
  failure_message_for_should_not do |model|
    "#{model} was NOT expected to allow #{attribute} to be mass-assigned"
  end
end
