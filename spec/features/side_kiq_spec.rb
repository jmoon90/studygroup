require 'spec_helper'
describe HardWorker do
  it 'checks that HardWorker is receiving a message' do
    expect(HardWorker).to.receive(:perform_async)
    HardWorker.perform_async
  end
end

