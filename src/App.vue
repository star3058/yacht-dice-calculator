<template>
  <v-app>
    <v-main>
      <YachtTable />
    </v-main>
  </v-app>
</template>

<script>
import YachtTable from "./components/YachtTable";

export default {
  name: "App",

  components: {
    YachtTable,
  },

  data: () => ({
    //
  }),
};
</script>
