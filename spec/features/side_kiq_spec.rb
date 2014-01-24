require 'spec_helper'
describe HardWorker do
  it 'checks that HardWorker is receiving a message' do
    expect(HardWorker).should_receive(:perform_async)
    HardWorker.perform_async
  end

  it 'checks that HardWorker is receiving a message' do
    expect(HardWorker).should_not_receive(:perform_async)
    HardWorker.perform_async
  end
end

