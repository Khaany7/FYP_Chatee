import 'package:chatee/features/select_contact/controller/select_contact_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chatee/common/widgets/error.dart';
import 'package:chatee/common/widgets/loader.dart';

class SelectContactsScreen extends ConsumerWidget {
  static const String routeName = '/select-contacts';

  const SelectContactsScreen({super.key});

void selectContact(WidgetRef ref, Contact selectedContact, BuildContext context) {
    final selectContactController = ref.read(SelectContactControllerProvider);
    selectContactController.selectContact(selectedContact, context);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Contacts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ref.watch(getContactsProvider).when(
            data: (contactList) {
              print('Fetched contacts: $contactList');
              if (contactList.isEmpty) {
                return const Center(
                  child: Text('No contacts found'),
                );
              }
              return ListView.builder(
                itemCount: contactList.length,
                itemBuilder: (context, index) {
                  final contact = contactList[index];
                  return InkWell(
                    onTap: () => selectContact(ref, contact, context),
                    child: ListTile(
                      title: Text(contact.displayName), //new contacts service
                    ),
                  );
                },
              );
            },
            error: (err, trace) {
              print('Error fetching contacts: $err');
              return ErrorScreen(error: err.toString());
            },
            loading: () => const Loader(),
          ),
    );
  }
}
