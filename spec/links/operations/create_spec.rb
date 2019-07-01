RSpec.describe Links::Operations::Create do
  let(:operation) { described_class.new(repo: link_repository, key_generator: key_generator) }
  let(:link_repository) { double(:link_repo, create: Link.new) }
  let(:key_generator) { -> { '123' } }

  subject { operation.call(url: 'https://google.com') }

  it 'calls repository with right args' do
    expect(link_repository).to receive(:create).with(url: 'https://google.com', key: '123')
    subject
  end

  context 'with real repository' do
    let(:operation) { described_class.new }
    let(:link_repo) { LinkRepository.new }

    after { link_repo.clear }

    it { expect { subject }.to change { link_repo.all.count }.by(1) }
  end
end
