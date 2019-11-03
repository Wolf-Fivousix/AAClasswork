export const getBenches = () => (
  $.ajax(
    method: "GET",
    url: "/api/bench"
  )
);