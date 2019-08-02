describe Fastlane::Actions::RmDerivedDataAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The rm_derived_data plugin is working!")

      Fastlane::Actions::RmDerivedDataAction.run(nil)
    end
  end
end
