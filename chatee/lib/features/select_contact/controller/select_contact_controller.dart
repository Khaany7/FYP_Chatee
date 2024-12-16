import 'package:chatee/features/select_contact/repository/select_contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/contact.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getContactsProvider = FutureProvider((ref) {
  final SelectContactRepository = ref.watch(selectContactRepositoryProvider);
  return SelectContactRepository.getContacts();
});

final SelectContactControllerProvider = Provider((ref) {
  final selectContactRepository = ref.watch(selectContactRepositoryProvider);
  return SelectContactController(ref, selectContactRepository);
});

class SelectContactController {
  final ProviderRef ref;
  final SelectContactRepository selectContactRepository;
  SelectContactController(this.ref, this.selectContactRepository);
  void selectContact(Contact selectedContact, BuildContext context) {
    selectContactRepository.selectContact(selectedContact, context);
  }
}
