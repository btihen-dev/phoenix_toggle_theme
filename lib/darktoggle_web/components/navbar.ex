defmodule DarktoggleWeb.Components.Navbar do
  use DarktoggleWeb, :html

  def render(assigns) do
    ~H"""
    <header class="absolute sticky inset-x-0 top-0 z-50 w-full">
      <nav class="border-b-4 border-orange-600">
        <div class="mx-auto max-w-7xl px-2 lg:px-6 xl:px-8">
          <div class="relative flex h-20 items-center justify-between">
            <div class="absolute inset-y-0 left-0 flex items-center lg:hidden">
              <!-- Mobile menu button-->
              <button
                type="button"
                phx-click={JS.toggle(to: "#mobile-menu")}
                class="relative inline-flex items-center justify-center rounded-lg p-2  text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300 focus:outline-none focus:ring-2 focus:ring-inset focus:ring-white"
                aria-controls="mobile-menu"
                aria-expanded="false"
              >
                <span class="absolute -inset-0.5"></span>
                <span class="sr-only">Open main menu</span>
                <!-- Icon when menu is closed. - Menu open: "hidden", Menu closed: "block" -->
                <svg
                  class="block h-6 w-6"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  aria-hidden="true"
                >
                  <path
                    stroke-linecap="round"
                    stroke-linejoin="round"
                    d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"
                  />
                </svg>
                <!-- Icon when menu is open. - Menu open: "block", Menu closed: "hidden" -->
                <svg
                  class="hidden h-6 w-6"
                  fill="none"
                  viewBox="0 0 24 24"
                  stroke-width="1.5"
                  stroke="currentColor"
                  aria-hidden="true"
                >
                  <path stroke-linecap="round" stroke-linejoin="round" d="M6 18L18 6M6 6l12 12" />
                </svg>
              </button>
            </div>
            <div class="hidden lg:flex lg:items-center lg:space-x-4">
              <.link
                href={~p"/"}
                class="rounded-lg px-3 py-2 text-md font-medium text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                Home
              </.link>
              <.link
                href={~p"/dev/dashboard"}
                class="rounded-lg px-3 py-2 text-md font-medium text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                Dashboard
              </.link>
              <.link
                href={~p"/dev/mailbox"}
                class="rounded-lg px-3 py-2 text-md font-medium text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                Mailbox
              </.link>
            </div>
            <div class="absolute left-1/2 transform -translate-x-1/2 flex items-center">
              <.link
                href={~p"/"}
                class="-m-1.5 p-2.5 flex items-center rounded-lg text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                <img class="h-8 w-auto" src={~p"/images/logo.svg"} alt="logo" />
                <span class="ml-4 text-2xl font-bold">Toggle Theme</span>
              </.link>
            </div>
            <div class="absolute inset-y-0 right-0 flex items-center pr-2 lg:static lg:inset-auto lg:ml-6 lg:pr-0">
              <ul class="relative z-10 flex items-center gap-2 px-1 sm:px-4 lg:px-6 justify-end">
                <%= if @current_user do %>
                  <li class="text-sm hidden lg:block leading-6 text-zinc-900 dark:text-gray-400">
                    <%= @current_user.email %>
                  </li>
                  <li>
                    <.link
                      href={~p"/users/settings"}
                      class="text-md leading-6 hidden lg:block font-semibold p-2.5 rounded-lg text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
                    >
                      Settings
                    </.link>
                  </li>
                  <li>
                    <.link
                      href={~p"/users/log_out"}
                      method="delete"
                      class="text-md leading-6 font-semibold p-2.5 rounded-lg text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
                    >
                      Log out
                    </.link>
                  </li>
                <% else %>
                  <li>
                    <.link
                      href={~p"/users/register"}
                      class="text-md leading-6 hidden md:block font-semibold p-2.5 rounded-lg bg-orange-400 text-gray-800 hover:bg-orange-300 dark:bg-orange-600 dark:text-gray-200 dark:hover:bg-orange-700"
                    >
                      Register
                    </.link>
                  </li>
                  <li>
                    <.link
                      href={~p"/users/log_in"}
                      class="text-md leading-6 font-semibold p-2.5 rounded-lg text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
                    >
                      Log in
                    </.link>
                  </li>
                <% end %>
              </ul>
              <DarktoggleWeb.Components.ToggleTheme.render />
            </div>
          </div>
        </div>
        <!-- Mobile menu, show/hide based on menu state. -->
        <div class="lg:hidden hidden" id="mobile-menu">
          <div class="space-y-1 px-2 pb-3 pt-2">
            <.link
              href={~p"/users/register"}
              class="block rounded-lg px-3 py-2 text-base font-bold text-orange-600 hover:bg-gray-100 dark:hover:bg-gray-700 dark:hover:text-gray-300"
            >
              Register
            </.link>
            <.link
              href={~p"/"}
              class="block rounded-lg px-3 py-2 text-base font-medium text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
            >
              Home
            </.link>
            <.link
              href={~p"/dev/dashboard"}
              class="block rounded-lg px-3 py-2 text-base font-medium text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
            >
              Dashboard
            </.link>
            <.link
              href={~p"/dev/mailbox"}
              class="block rounded-lg px-3 py-2 text-base font-medium text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
            >
              Mailbox
            </.link>
            <%= if @current_user do %>
              <p class="px-3 py-2 text-sm leading-6 text-zinc-900 dark:text-gray-400">
                <%= @current_user.email %>
              </p>
              <.link
                href={~p"/users/settings"}
                class="block rounded-lg px-3 py-2 text-base font-semibold text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                Settings
              </.link>
              <.link
                href={~p"/users/log_out"}
                method="delete"
                class="block rounded-lg px-3 py-2 text-base font-semibold text-grey-800 hover:bg-gray-100 dark:text-gray-200 dark:hover:bg-gray-700 dark:hover:text-gray-300"
              >
                Log out
              </.link>
            <% end %>
          </div>
        </div>
      </nav>
    </header>
    """
  end
end
