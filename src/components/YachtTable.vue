<template>
  <v-container>
    <v-row>
      <v-col cols="4">
        <h1>요트 다이스!</h1>
      </v-col>
      <v-col cols="4">
        <v-text-field
          placeholder="name"
          v-model="name"
          dense
          :append-outer-icon="'mdi-plus'"
          @click:append-outer="addPlayer"
          @keyup.enter.prevent="addPlayer"
        ></v-text-field>
      </v-col>
      <v-col cols="4">
        <v-btn
          outlined
          color="purple"
          @click="clear"
        >
          Replay
        </v-btn>
        <v-btn
          class="ml-2"
          outlined
          color="blue"
          @click="finish"
        >
          Finish
        </v-btn>
      </v-col>
    </v-row>
    <v-row>
      <v-col cols="12">
        <table dense>
          <thead>
            <tr>
              <th></th>
              <th
                v-for="p in players"
                :key="p.name"
              >
                {{ p.name }}

                <v-icon color="green">mdi-flag</v-icon>{{ p.count }}
                <v-btn
                  icon
                  @click="deletePlayer(p.name)"
                >
                  <v-icon>mdi-window-close</v-icon>
                </v-btn>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>
                <v-icon>mdi-dice-1</v-icon> 에이스
              </td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.ace"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>
                <v-icon>mdi-dice-2</v-icon> 듀스
              </td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.deuce"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>
                <v-icon>mdi-dice-3</v-icon> 트리플
              </td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.three"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>
                <v-icon>mdi-dice-4</v-icon> 쿼드
              </td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.four"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>
                <v-icon>mdi-dice-5</v-icon> 펜타
              </td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.five"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>
                <v-icon>mdi-dice-6</v-icon> 헥사
              </td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.six"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td style="background-color: #e0e0e0;"><small>상단 점수의 합이 63점 이상이라면<br /></small>보너스 +35점</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                {{ p.subTotal }}/63
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.bonus"
                  clearable
                  hide-spin-buttons
                  dense
                  prefix="+"
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>초이스</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.choice"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>포커</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.fourKind"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>풀하우스</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.fullHousee"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>스몰 스트레이트</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.smallStraight"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                  placeholder="15"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>라지 스트레이트</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.largeStraight"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                  placeholder="30"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td>요트</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.yacht"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                  placeholder="50"
                ></v-text-field>
              </td>
            </tr>
            <tr>
              <td style="background-color: #bdbdbd;">총점</td>
              <td
                v-for="p in players"
                :key="p.name"
              >
                <v-text-field
                  type="number"
                  width="40px"
                  v-model="p.total"
                  clearable
                  hide-spin-buttons
                  dense
                  outlined
                  hide-details="true"
                ></v-text-field>
              </td>
            </tr>
          </tbody>
        </table>
      </v-col>
    </v-row>
    <v-snackbar
      v-model="snackbar"
      timeout="3000"
      vertical="vertical"
    >
      {{ msg }}

      <template v-slot:action="{ attrs }">
        <v-btn
          color="blue"
          text
          v-bind="attrs"
          @click="snackbar = false"
        >
          Close
        </v-btn>
      </template>
    </v-snackbar>
  </v-container>
</template>

<script>
export default {
  data() {
    return {
      snackbar: false,
      msg: "",
      name: "",
      players: [],
      initialState: {
        ace: undefined,
        deuce: undefined,
        three: undefined,
        four: undefined,
        five: undefined,
        six: undefined,
        bonus: undefined,
        choice: undefined,
        fourKind: undefined,
        fullHousee: undefined,
        smallStraight: undefined,
        largeStraight: undefined,
        yacht: undefined,
        total: 0,
        subTotal: 0,
      },
    };
  },
  watch: {
    players: {
      deep: true,
      handler() {
        this.players.forEach((p) => {
          p.subTotal =
            Number(p.ace || 0) +
            Number(p.deuce || 0) +
            Number(p.three || 0) +
            Number(p.four || 0) +
            Number(p.five || 0) +
            Number(p.six || 0);

          if (p.subTotal >= 63) {
            p.bonus = 35;
          } else {
            p.bonus = 0;
          }
          p.total =
            p.subTotal +
            p.bonus +
            Number(p.choice || 0) +
            Number(p.fourKind || 0) +
            Number(p.fullHousee || 0) +
            Number(p.smallStraight || 0) +
            Number(p.largeStraight || 0) +
            Number(p.yacht || 0);
        });
      },
    },
  },
  methods: {
    addPlayer() {
      if (!this.name) {
        return;
      }
      if (this.players.find((p) => p.name === this.name)) {
        this.msg = "중복! 다른 이름을 사용하세요";
        this.snackbar = true;
        return;
      }

      this.players.push({
        name: this.name,
        count: 0,
        ...this.initialState,
      });
      this.name = "";
    },
    deletePlayer(name) {
      if (confirm("삭제하시겠습니까?")) {
        this.players = this.players.filter((p) => p.name !== name);
      }
    },
    clear() {
      if (confirm("점수가 초기화됩니다. 다시 시작하시겠습니까?")) {
        this.players.forEach((p) => {
          Object.assign(p, this.initialState);
        });
      }
    },
    finish() {
      if (confirm("경기가 끝났습니까?")) {
        let max = 0;
        let winner = [];
        this.players.forEach((p) => {
          if (p.total > max) {
            max = p.total;
            winner = [p];
          } else if (p.total === max) {
            winner.push(p);
          }
        });

        this.msg = `${winner.map((p) => p.name)} 우승~~~`;
        this.snackbar = true;
        winner.forEach((p) => (p.count += 1));
        this.players.forEach((p) => {
          Object.assign(p, this.initialState);
        });
      }
    },
  },
};
</script>

<style scoped>
/* th,
td {
  border: 1px solid black;
  border-collapse: collapse;
} */
td {
  height: 40px;
}
th {
  font-size: 20px !important;
}
</style>