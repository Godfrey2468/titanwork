defmodule DemoWeb.PageLive do
  use DemoWeb, :live_view

   def mount(_params, _session, socket) do
   {:ok,assign( socket, number: 5)}
   end

   @spec render(any) :: Phoenix.LiveView.Rendered.t()
   def render(assigns) do
   ~H"""
    <%= @number %>
    Hello world

    <.button phx-click="add">Add</.button>
    <.button phx-click="Minus">Minus</.button>
   <.button phx-click="TImes 2">TImes 2</.button>
    """
   end

  def handle_event("add", _params, socket) do
  {:noreply, assign(socket, number: socket.assigns.number + 1)}

  end
  def handle_event("Minus", _params, socket) do
  {:noreply, assign(socket, number: socket.assigns.number - 1)}

  end
  def handle_event("TImes 2", _params, socket) do
  {:noreply, assign(socket, number: socket.assigns.number * 2)}

  end
  end
