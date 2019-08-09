defmodule Window do

  defmodule State do
    defstruct [:win, :object]
  end

  def start_link do
    start_link([])
  end

  def start_link(config) do
    :wx_object.start_link(__MODULE__, config, [])
  end

  def init(config) do
    :wx.new(config)
    Process.flag(:trap_exit, true)

    frame = :wxFrame.new(:wx.null, :wx_const.wx_id_any, 'Cube', [size: {300, 300}])
    :wxFrame.show(frame)
    {frame, %State{win: frame}}
  end
end
