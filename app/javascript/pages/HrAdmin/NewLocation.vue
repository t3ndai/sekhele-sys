<template>
    <div>
        <div>
            <Button
                label="New Location"
                icon="pi pi-plus"
                @click="visible = true"
                class="location-btn"
            />
        </div>
        <Dialog
            v-model="visible"
            header="New Location"
            :visible="visible"
            @update:visible="visible = $event"
        >
            <form @submit.prevent="saveLocation">
                <div class="flex flex-col mb-2 field">
                    <label for="name">Name</label>
                    <InputText id="name" v-model="form.name" />
                </div>
                <div class="flex flex-col mb-2 field">
                    <label for="addr_line1">Address Line 1</label>
                    <InputText id="addr_line1" v-model="form.addr_line1" />
                </div>
                <div class="flex flex-col mb-2 field">
                    <label for="addr_line2">Address Line 2</label>
                    <InputText id="addr_line2" v-model="form.addr_line2" />
                </div>
                <div class="flex flex-col mb-2 field">
                    <label for="addr_line3">Address Line 3</label>
                    <InputText id="addr_line3" v-model="form.addr_line3" />
                </div>
                <div class="flex flex-col mb-2 field">
                    <label for="city">City</label>
                    <InputText id="city" v-model="form.city" />
                </div>
                <div class="flex flex-col mb-2 field">
                    <label for="country">Country</label>
                    <InputText id="country" v-model="form.country" />
                </div>

                <div class="mt-2">
                    <Button
                        class="location-btn"
                        label="Save"
                        icon="pi pi-save"
                        type="submit"
                        :disabled="form.processing"
                    />
                </div>
            </form>
        </Dialog>
    </div>
</template>

<script setup>
import { Dialog, Button, InputText } from "primevue";
import { ref, computed } from "vue";
import { useForm, usePage } from "@inertiajs/vue3";

const page = usePage();
const org_id = computed(() => page.props.org_id).value;

const form = useForm({
    name: "",
    addr_line1: "",
    addr_line2: "",
    addr_line3: "",
    city: "",
    country: "",
});

const visible = ref(false);

function saveLocation() {
    form.post(`/organizations/${org_id}/locations`, {
        onSuccess: () => {
            form.reset();
            visible.value = false;
        },
    });
}
</script>

<style scoped>
.location-btn {
    background-color: orangered;
    border: none;

    :hover {
        background-color: #ffb59a;
    }
}
</style>
