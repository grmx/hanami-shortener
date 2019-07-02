RSpec.describe Web::Controllers::Links::Show, type: :action do
  let(:action) { described_class.new(operation: operation) }
  let(:params) { Hash[id: 1] }
  let(:operation) { ->(_) { entity } }
  let(:response) { action.call(params) }

  context 'when link exists' do
    let(:entity) { Link.new(url: 'google.com') }

    it { expect(response).to redirect_to 'google.com' }
  end

  context 'when link does not exist' do
    let(:entity) { nil }

    it { expect(response[0]).to eq 404 }
    it { expect(response[2]).to eq ['Not Found'] }
  end

  context 'when action uses real repository' do
    let(:action) { described_class.new }
    let(:params) { Hash[id: link.key] }
    let(:link) { link_repo.create(key: '123', url: 'google.com') }
    let(:link_repo) { LinkRepository.new }

    after { link_repo.clear }

    it { expect(response).to redirect_to link.url }
  end
end
